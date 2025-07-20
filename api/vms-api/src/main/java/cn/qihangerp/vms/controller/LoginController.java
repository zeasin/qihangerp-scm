package cn.qihangerp.vms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.common.constant.Constants;
import cn.qihangerp.common.redis.RedisCache;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.LoginBody;
import cn.qihangerp.domain.SysUser;
import cn.qihangerp.domain.vo.UserVo;
import cn.qihangerp.model.sys.domain.SysMenuVms;
import cn.qihangerp.model.sys.service.SysMenuVmsService;
import cn.qihangerp.service.ISysUserService;
import cn.qihangerp.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 登录验证
 *
 * @author qihang
 */
@Slf4j
@RestController
public class LoginController extends BaseController {

    @Autowired
    private SysMenuVmsService menuVmsService;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private ISysUserService userService;

    private static int expireTime = 30;
    protected static final long MILLIS_SECOND = 1000;
    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    @PostMapping("/logout")
    public AjaxResult logout() {
        return AjaxResult.success();
    }

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        SysUser sysUser = userService.selectUserByUserName(loginBody.getUsername());
        if (sysUser != null ) {
            log.info("==========登录用户{}={}=====", sysUser.getUserName(), sysUser.getUserType());
            if (sysUser.getStatus().equals("1")) {
                return AjaxResult.error("用户已锁定，请联系管理员解锁!");
            }
            if(!sysUser.getUserType().equals("10")){
                if(sysUser.getUserType().equals("20")) {
                    return AjaxResult.error("商户账号请登录MMS系统!");
                }else if(sysUser.getUserType().equals("00")) {
                    return AjaxResult.error("管理员请登录OMS系统!");
                }else{
                    return AjaxResult.error("账号非法，请联系管理员！");
                }
            }
            try {
                AjaxResult ajax = AjaxResult.success();
                // 生成令牌
                String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                        loginBody.getUuid());
                ajax.put(Constants.TOKEN, token);
                redisCache.deleteObject(loginBody.getUsername());
                return ajax;
            } catch (cn.qihangerp.security.UserPasswordNotMatchException s) {
                return AjaxResult.error(1500, "密码不正确");
            } catch (Exception e) {
                return AjaxResult.error(1500, e.getMessage());
            }

        } else {
            return AjaxResult.error("用户不存在");
        }
    }

//    @PostMapping("/login")
//    public AjaxResult login(@RequestBody LoginBody loginBody) {
//        ErpVendor supplier = supplierService.getByLoginName(loginBody.getUsername());
//        if (supplier == null) return AjaxResult.error(1500, "供应商账号不存在");
//        String pwd = PasswordUtils.hashPasswordWithSalt(loginBody.getPassword(), supplier.getLoginSlat());
//        if (!pwd.equals(supplier.getLoginPwd())) return AjaxResult.error(1504, "账号密码不正确");
//        // 验证用户名和密码（略）
//        // 如果验证成功，生成 JWT
//        String token = JwtUtils.generateToken(loginBody.getUsername(),supplier.getId());
//
////            // 根据uuid将loginUser缓存
////        String userKey =  "login_tokens:"+tokenUuid;
////        redisCache.setCacheObject(userKey, supplier, expireTime, TimeUnit.MINUTES);
//
//        AjaxResult ajax = AjaxResult.success();
//        ajax.put(Constants.TOKEN, token);
//        return ajax;
//    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
//        if(SecurityUtils.getLoginUser().getIsSupplier()==null) return AjaxResult.error(401,"shibai");
//        // 角色集合
////        Set<String> roles = permissionService.getRolePermission(user);
////        // 权限集合
////        Set<String> permissions = permissionService.getMenuPermission(user);
//        AjaxResult ajax = AjaxResult.success();
//        ajax.put("user", new ErpVendor());
//        ajax.put("roles", null);
//        ajax.put("permissions", null);
//        return ajax;
        UserVo user = SecurityUtils.getLoginUser().getUser();
        log.info("========登录用户：{}==身份：{}=====",user.getUserName(),user.getUserIdentity());
        SysUser sysUser = userService.selectUserById(user.getUserId());

        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
//        ajax.put("roles", roles);
//        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
//        Long userId = SecurityUtils.getUserId();

        List<SysMenuVms> menus = menuVmsService.selectMenuTree();
//        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
//        return AjaxResult.success(menuService.buildMenus(menus));
        return AjaxResult.success(menuVmsService.buildMenus(menus));
    }
}
