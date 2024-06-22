package cn.qihangerp.oms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.constant.Constants;
import cn.qihangerp.common.exception.ServiceException;
import cn.qihangerp.common.model.LoginBody;
import cn.qihangerp.common.model.vo.RouterVo;
import cn.qihangerp.oms.domain.OmsMenu;
import cn.qihangerp.oms.domain.ScmDistributor;
import cn.qihangerp.oms.security.SecurityUtils;
import cn.qihangerp.oms.security.UserPasswordNotMatchException;
import cn.qihangerp.oms.service.LoginService;
import cn.qihangerp.oms.service.OmsMenuService;
import cn.qihangerp.oms.service.ScmDistributorService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.RedisConnectionFailureException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * 登录验证
 * 
 * @author qihang
 */
@AllArgsConstructor
@RestController
public class LoginController
{
    private final LoginService loginService;
    private final OmsMenuService menuService;
    private final ScmDistributorService distributorService;

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
        try{
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);

        return ajax;
        }catch (UserPasswordNotMatchException ex){
            return AjaxResult.error(ex.getMessage());
        }catch (ServiceException e){
            return AjaxResult.error(e.getMessage());
        }
        catch (RedisConnectionFailureException exception){
            return AjaxResult.error("Redis连接失败");
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
        ScmDistributor user = SecurityUtils.getLoginDistributor().getDistributor();
//        // 角色集合
//        Set<String> roles = permissionService.getRolePermission(user);
//        // 权限集合
//        Set<String> permissions = permissionService.getMenuPermission(user);
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
