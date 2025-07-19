package cn.qihangerp.api.controller.system;

import cn.qihangerp.api.service.SysLoginService;
import cn.qihangerp.api.service.SysPermissionService;
import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.constant.Constants;
import cn.qihangerp.common.redis.RedisCache;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.LoginBody;
import cn.qihangerp.domain.SysMenu;
import cn.qihangerp.domain.SysUser;
import cn.qihangerp.domain.vo.RouterVo;
import cn.qihangerp.domain.vo.UserVo;
import cn.qihangerp.model.sys.domain.SysMenuMms;
import cn.qihangerp.model.sys.domain.SysMenuVms;
import cn.qihangerp.model.sys.service.ISysMenuService;
import cn.qihangerp.model.sys.service.SysMenuMmsService;
import cn.qihangerp.model.sys.service.SysMenuVmsService;
import cn.qihangerp.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private ISysMenuService menuService;
    @Autowired
    private SysMenuMmsService mmsMenuService;
    @Autowired
    private SysPermissionService permissionService;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private SysMenuVmsService vmsMenuService;
    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        SysUser sysUser = userService.selectUserByUserName(loginBody.getUsername());
        if (sysUser != null) {
            log.info("==========登录用户{}={}=====", sysUser.getUserName(), sysUser.getUserType());
            if (sysUser.getStatus().equals("1")) {
                return AjaxResult.error("用户已锁定，请联系管理员解锁!");
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
//        if(SecurityUtils.getLoginUser().getUser().getUserIdentity()!=0) return AjaxResult.error(401,"身份不匹配");
        UserVo user = SecurityUtils.getLoginUser().getUser();
        log.info("========登录用户：{}==身份：{}=====",user.getUserName(),user.getUserIdentity());
        SysUser sysUser = userService.selectUserById(user.getUserId());
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(sysUser);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(sysUser);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
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
        SysUser sysUser = userService.selectUserById(userId);
        log.info("==========登录用户{}={}=====",sysUser.getUserName(),sysUser.getUserType());
        if(sysUser.getUserType().equals("00")) {
            List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
            return AjaxResult.success(menuService.buildMenus(menus));
        }else if(sysUser.getUserType().equals("20")) {
            // 商户（商户独立菜单）
            List<SysMenuMms> menus = mmsMenuService.selectMenuAll();
            List<RouterVo> routerVos = mmsMenuService.buildMenus(menus);
            return AjaxResult.success(routerVos);
        }else if(sysUser.getUserType().equals("10")) {
            // 供应商（供应商独立菜单）
            List<SysMenuVms> menus = vmsMenuService.selectMenuTree();
            List<RouterVo> routerVos = vmsMenuService.buildMenus(menus);
            return AjaxResult.success(routerVos);
        }
        else {
            return AjaxResult.error("登录身份未知");
        }
    }
}
