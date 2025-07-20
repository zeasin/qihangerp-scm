package cn.qihangerp.api.controller.tenant;

import cn.qihangerp.api.domain.OmsTenant;
import cn.qihangerp.api.domain.bo.TenantBo;
import cn.qihangerp.api.service.OmsTenantService;
import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.SysUser;
import cn.qihangerp.model.shop.domain.Vendor;
import cn.qihangerp.model.shop.service.VendorService;
import cn.qihangerp.service.ISysUserService;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;

@AllArgsConstructor
@RequestMapping("/vendor")
@RestController
public class VendorController extends BaseController {
    private final VendorService vendorService;
    private final ISysUserService userService;
    @GetMapping("/list")
    public TableDataInfo list(Vendor bo, PageQuery pageQuery)
    {
        PageResult<Vendor> pageResult = vendorService.queryPageList(bo, pageQuery);
        //
        return getDataTable(pageResult);
    }

    /**
     * 获取详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(vendorService.getById(id));
    }

    /**
     * 新增
     */
    @PostMapping()
    public AjaxResult add(@RequestBody Vendor tenant)
    {
//        OmsTenant scmDistributor = tenantService.selectTenantByUserName(tenant.getUserName());
//        if(scmDistributor!=null){
//            return AjaxResult.error("登录账号已存在");
//        }
//        tenant.setPassword(SecurityUtils.encryptPassword(tenant.getPassword()));
        tenant.setCreateTime(new Date());
//        shop.setUpdateTime(new Date());
        return toAjax(vendorService.save(tenant));
    }

    /**
     * 修改
     */
    @PutMapping()
    public AjaxResult edit(@RequestBody Vendor shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(vendorService.updateById(shop));
    }
    /**
     * 删除
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(vendorService.removeBatchByIds(Arrays.stream(ids).toList()));
    }

    @PostMapping("/setLoginName")
    public AjaxResult setLoginName(@RequestBody Vendor vendor)
    {
        if(vendor.getId()==null) return AjaxResult.error("缺少参数：id");
        if(!StringUtils.hasText(vendor.getLoginName())) return AjaxResult.error("请输入登录名");
        if(!StringUtils.hasText(vendor.getLoginPwd())) return AjaxResult.error("请输入登录密码");


        Vendor supplier = vendorService.getById(vendor.getId());
        if(supplier==null) return AjaxResult.error("供应商不存在");

        if(StringUtils.isEmpty(supplier.getLoginName())  || !supplier.getLoginName().equals(vendor.getLoginName())) {
            Vendor tmp = vendorService.getByLoginName(vendor.getLoginName());
            if (tmp != null) return AjaxResult.error("登录账号已存在");
        }

        SysUser user = new SysUser();
        user.setUserName(vendor.getLoginName());
        user.setPhonenumber(supplier.getContact());
        if (!userService.checkUserNameUnique(user)) {
            return error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.hasText(user.getPhonenumber()) && !userService.checkPhoneUnique(user)) {
            return error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.hasText(user.getEmail()) && !userService.checkEmailUnique(user)) {
            return error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        String pwd = SecurityUtils.encryptPassword(vendor.getLoginPwd());
        // 更新vendor
        Vendor update = new Vendor();
        update.setId(supplier.getId());
        update.setLoginName(vendor.getLoginName());
        update.setLoginSlat("");
        update.setLoginPwd(pwd);
        update.setUpdateBy(getUsername());
        update.setUpdateTime(new Date());
        vendorService.updateById(update);
        // 添加user
        user.setCreateBy(getUsername());
        user.setRoleId(0L);
        user.setDeptId(update.getId());
        user.setCreateBy("设置供应商登录名");
        user.setRemark("供应商："+supplier.getName());
        user.setCreateTime(new Date());
        user.setPassword(pwd);
        user.setNickName(supplier.getName());
        user.setUserType("10");
        userService.insertUser(user);
        return AjaxResult.success();
    }
}
