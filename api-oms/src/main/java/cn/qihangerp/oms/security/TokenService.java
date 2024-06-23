package cn.qihangerp.oms.security;

import cn.qihangerp.common.redis.RedisCache;
import cn.qihangerp.common.utils.AddressUtils;
import cn.qihangerp.common.utils.IdUtils;
import cn.qihangerp.common.utils.IpUtils;
import cn.qihangerp.common.utils.ServletUtils;
import eu.bitwalker.useragentutils.UserAgent;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.micrometer.common.util.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.RedisConnectionFailureException;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * token验证处理
 *
 * @author qihang
 */
@Component
public class TokenService
{
    // 令牌自定义标识
//    @Value("${token.header:'Authorization'}")
//    private String header;

    // 令牌秘钥
    @Value("${token.secret:'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkrstuvwxyzabcdefghijklmnopqrstuvwxyz'}")
    private String secret;

    // 令牌有效期（默认30分钟）
    @Value("${token.expireTime:30}")
    private int expireTime;

    protected static final long MILLIS_SECOND = 1000;

    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;

    /**
     * 令牌前缀
     */
    public static final String LOGIN_CLIENT_KEY = "login_client_key";

    /**
     * 登录用户 redis key
     */
    public static final String LOGIN_TOKEN_KEY = "login_dist_tokens:";

    /**
     * 令牌前缀
     */
    public static final String TOKEN_PREFIX = "Bearer ";

    @Autowired
    private RedisCache redisCache;

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public LoginTenant getLoginDistributor(HttpServletRequest request)
    {
        // 获取请求携带的令牌
        String token = getToken(request);
        if (StringUtils.isNotEmpty(token))
        {
            try
            {
                Claims claims = parseToken(token);
                // 解析对应的权限以及用户信息
                String uuid = (String) claims.get(LOGIN_CLIENT_KEY);
                String userKey = getTokenKey(uuid);
                LoginTenant user = redisCache.getCacheObject(userKey);
                return user;
            }
            catch (Exception e)
            {
            }
        }
        return null;
    }

    /**
     * 设置用户身份信息
     */
    public void setLoginDistributor(LoginTenant loginTenant)
    {
        if (loginTenant != null && StringUtils.isNotEmpty(loginTenant.getToken()))
        {
            refreshToken(loginTenant);
        }
    }

    /**
     * 删除用户身份信息
     */
    public void delLoginUser(String token)
    {
        if (StringUtils.isNotEmpty(token))
        {
            String userKey = getTokenKey(token);
            redisCache.deleteObject(userKey);
        }
    }

    /**
     * 创建令牌
     *
     * @param loginTenant 用户信息
     * @return 令牌
     */
    public String createToken(LoginTenant loginTenant)
    {
        String token = IdUtils.fastUUID();
        loginTenant.setToken(token);
        setUserAgent(loginTenant);
        refreshToken(loginTenant);

        Map<String, Object> claims = new HashMap<>();
        claims.put(LOGIN_CLIENT_KEY, token);
        return createToken(claims);
    }

    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     *
     * @param loginTenant
     * @return 令牌
     */
    public void verifyToken(LoginTenant loginTenant)
    {
        long expireTime = loginTenant.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN)
        {
            refreshToken(loginTenant);
        }
    }

    /**
     * 刷新令牌有效期
     *
     * @param loginTenant 登录信息
     */
    public void refreshToken(LoginTenant loginTenant)
    {
        loginTenant.setLoginTime(System.currentTimeMillis());
        loginTenant.setExpireTime(loginTenant.getLoginTime() + expireTime * MILLIS_MINUTE);
        // 根据uuid将loginUser缓存
        String userKey = getTokenKey(loginTenant.getToken());
        try{
        redisCache.setCacheObject(userKey, loginTenant, expireTime, TimeUnit.MINUTES);
        }catch (RedisConnectionFailureException ex){
            throw ex;
        }
    }

    /**
     * 设置用户代理信息
     *
     * @param loginTenant 登录信息
     */
    public void setUserAgent(LoginTenant loginTenant)
    {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = IpUtils.getIpAddr();
        loginTenant.setIpaddr(ip);
        loginTenant.setLoginLocation(AddressUtils.getRealAddressByIP(ip));
        loginTenant.setBrowser(userAgent.getBrowser().getName());
        loginTenant.setOs(userAgent.getOperatingSystem().getName());
    }

    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims)
    {
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
        return token;
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    private Claims parseToken(String token)
    {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 从令牌中获取用户名
     *
     * @param token 令牌
     * @return 用户名
     */
    public String getUsernameFromToken(String token)
    {
        Claims claims = parseToken(token);
        return claims.getSubject();
    }

    /**
     * 获取请求token
     *
     * @param request
     * @return token
     */
    private String getToken(HttpServletRequest request)
    {
        String token = request.getHeader("Authorization");
        if (StringUtils.isNotEmpty(token) && token.startsWith(TOKEN_PREFIX))
        {
            token = token.replace(TOKEN_PREFIX, "");
        }
        return token;
    }

    private String getTokenKey(String uuid)
    {
        return LOGIN_TOKEN_KEY + uuid;
    }
}
