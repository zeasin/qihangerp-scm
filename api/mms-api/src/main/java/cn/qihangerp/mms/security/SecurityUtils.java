//package cn.qihangerp.oms.security;
//
//
//import cn.qihangerp.common.constant.HttpStatus;
//import cn.qihangerp.common.exception.ServiceException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//import java.io.Serializable;
//
///**
// * 安全服务工具类
// *
// * @author qihang
// */
//public class SecurityUtils implements Serializable
//{
//    /**
//     * 用户ID
//     **/
//    public static Long getUserId()
//    {
//        try
//        {
//            return getLoginDistributor().getUserId();
//        }
//        catch (Exception e)
//        {
//            throw new ServiceException("获取用户ID异常", HttpStatus.UNAUTHORIZED);
//        }
//    }
//
//
//
//    /**
//     * 获取用户账户
//     **/
//    public static String getUsername()
//    {
//        try
//        {
//            return getLoginDistributor().getUsername();
//        }
//        catch (Exception e)
//        {
//            throw new ServiceException("获取用户账户异常", HttpStatus.UNAUTHORIZED);
//        }
//    }
//
//    /**
//     * 获取用户
//     **/
//    public static LoginTenant getLoginDistributor()
//    {
//        try
//        {
//            return (LoginTenant) getAuthentication().getPrincipal();
//        }
//        catch (Exception e)
//        {
//            throw new ServiceException("获取用户信息异常", HttpStatus.UNAUTHORIZED);
//        }
//    }
//
//    /**
//     * 获取Authentication
//     */
//    public static Authentication getAuthentication()
//    {
//        return SecurityContextHolder.getContext().getAuthentication();
//    }
//
//    /**
//     * 生成BCryptPasswordEncoder密码
//     *
//     * @param password 密码
//     * @return 加密字符串
//     */
//    public static String encryptPassword(String password)
//    {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        return passwordEncoder.encode(password);
//    }
//
//    /**
//     * 判断密码是否相同
//     *
//     * @param rawPassword 真实密码
//     * @param encodedPassword 加密后字符
//     * @return 结果
//     */
//    public static boolean matchesPassword(String rawPassword, String encodedPassword)
//    {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        return passwordEncoder.matches(rawPassword, encodedPassword);
//    }
//
//    /**
//     * 是否为管理员
//     *
//     * @param userId 用户ID
//     * @return 结果
//     */
//    public static boolean isAdmin(Long userId)
//    {
//        return userId != null && 1L == userId;
//    }
//}
