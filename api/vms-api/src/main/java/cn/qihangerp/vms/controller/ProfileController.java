//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.module.domain.ErpVendor;
//import cn.qihangerp.module.service.ErpVendorService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.utils.PasswordUtils;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Date;
//
///**
// * 个人信息
// *
// * @author qihang
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/user/profile")
//public class ProfileController extends BaseController
//{
//    private ErpVendorService supplierService;
//    /**
//     * 个人信息
//     */
//    @GetMapping
//    public AjaxResult profile(HttpServletRequest request)
//    {
//        ErpVendor supplier = supplierService.getById(getUserId());
//
//        return AjaxResult.success(supplier);
//    }
//
//    /**
//     * 修改用户
//     */
////    @PutMapping
////    public AjaxResult updateProfile(@RequestBody SysUser user)
////    {
////        LoginUser loginUser = getLoginUser();
////        SysUser sysUser = loginUser.getUser();
////        user.setUserName(sysUser.getUserName());
////        if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user))
////        {
////            return error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
////        }
////        if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user))
////        {
////            return error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
////        }
////        user.setUserId(sysUser.getUserId());
////        user.setPassword(null);
////        user.setAvatar(null);
////        user.setDeptId(null);
////        if (userService.updateUserProfile(user) > 0)
////        {
////            // 更新缓存用户信息
////            sysUser.setNickName(user.getNickName());
////            sysUser.setPhonenumber(user.getPhonenumber());
////            sysUser.setEmail(user.getEmail());
////            sysUser.setSex(user.getSex());
////            tokenService.setLoginUser(loginUser);
////            return success();
////        }
////        return error("修改个人信息异常，请联系管理员");
////    }
//
//    /**
//     * 重置密码
//     */
//    @PutMapping("/updatePwd")
//    public AjaxResult updatePwd(String oldPassword, String newPassword,HttpServletRequest request)
//    {
//        ErpVendor supplier = supplierService.getById(getUserId());
//        if(supplier==null) return AjaxResult.error("信息错误，请重新登录");
//        String oldPwd = PasswordUtils.hashPasswordWithSalt(oldPassword, supplier.getLoginSlat());
//        if (!oldPwd.equals(supplier.getLoginPwd())) return AjaxResult.error(1504, "账号密码不正确");
//
//        String newPwd =PasswordUtils.hashPasswordWithSalt(newPassword, supplier.getLoginSlat());
//        if(newPwd.equals(oldPwd)) return AjaxResult.error("新密码不能与旧密码相同");
//
//        ErpVendor update = new ErpVendor();
//        update.setId(supplier.getId());
//        update.setLoginPwd(newPwd);
//        update.setUpdateTime(new Date());
//        supplierService.updateById(update);
//        return success();
//    }
//
//
//}
