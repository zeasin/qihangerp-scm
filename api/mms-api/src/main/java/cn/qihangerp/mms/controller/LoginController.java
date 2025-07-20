package cn.qihangerp.mms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.constant.Constants;
import cn.qihangerp.common.exception.ServiceException;
import cn.qihangerp.common.redis.RedisCache;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.LoginBody;
import cn.qihangerp.domain.SysUser;
import cn.qihangerp.domain.vo.RouterVo;
import cn.qihangerp.domain.vo.UserVo;
import cn.qihangerp.mms.domain.OmsMenu;
import cn.qihangerp.mms.service.LoginService;
import cn.qihangerp.mms.service.OmsMenuService;
import cn.qihangerp.service.ISysUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.RedisConnectionFailureException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

/**
 * 登录验证
 *
 * @author qihang
 */
@Slf4j
@AllArgsConstructor
@RestController
public class LoginController
{
    private final LoginService loginService;
    private final OmsMenuService menuService;
    private final RedisCache redisCache;
    private final ISysUserService userService;
//    private final OmsTenantService tenantService;

//    @Autowired
//    private SysPermissionService permissionService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        SysUser sysUser = userService.selectUserByUserName(loginBody.getUsername());
        if (sysUser != null) {
            log.info("==========登录用户{}={}=====", sysUser.getUserName(), sysUser.getUserType());
            if (sysUser.getStatus().equals("1")) {
                return AjaxResult.error("用户已锁定，请联系管理员解锁!");
            }
            if(!sysUser.getUserType().equals("20")){
                if(sysUser.getUserType().equals("10")) {
                    return AjaxResult.error("供应商账号请登录VMS系统!");
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

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
//        OmsTenant tenant = SecurityUtils.getLoginDistributor().getDistributor();
////        // 角色集合
////        Set<String> roles = permissionService.getRolePermission(user);
////        // 权限集合
////        Set<String> permissions = permissionService.getMenuPermission(user);
//        AjaxResult ajax = AjaxResult.success();
//        ajax.put("user", tenant);
////        ajax.put("roles", roles);
////        ajax.put("permissions", permissions);
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
        Long userId = SecurityUtils.getUserId();
        List<OmsMenu> menus = menuService.selectMenuAll();
        List<RouterVo> routerVos = menuService.buildMenus(menus);
        return AjaxResult.success(routerVos);
    }
}
