package cn.qihangerp.scm.controller.merchant;

import cn.qihangerp.model.shop.domain.OmsMerchant;
import cn.qihangerp.model.shop.bo.TenantBo;
import cn.qihangerp.model.shop.service.OmsMerchantService;
import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@AllArgsConstructor
@RequestMapping("/merchant")
@RestController
public class MerchantController extends BaseController {
    private final OmsMerchantService tenantService;

    @GetMapping("/list")
    public TableDataInfo list(TenantBo bo, PageQuery pageQuery)
    {
        PageResult<OmsMerchant> pageResult = tenantService.queryPageList(bo, pageQuery);
        //
        return getDataTable(pageResult);
    }

    /**
     * 获取详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tenantService.getById(id));
    }

    /**
     * 新增
     */
    @PostMapping()
    public AjaxResult add(@RequestBody OmsMerchant tenant)
    {
        OmsMerchant scmDistributor = tenantService.selectTenantByUserName(tenant.getUserName());
        if(scmDistributor!=null){
            return AjaxResult.error("登录账号已存在");
        }
        tenant.setPassword(SecurityUtils.encryptPassword(tenant.getPassword()));
        tenant.setCreateTime(new Date());
//        shop.setUpdateTime(new Date());
        return toAjax(tenantService.save(tenant));
    }

    /**
     * 修改
     */
    @PutMapping()
    public AjaxResult edit(@RequestBody OmsMerchant shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(tenantService.updateById(shop));
    }
}
