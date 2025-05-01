package cn.qihangerp.api.controller.tenant;

import cn.qihangerp.api.domain.OmsTenant;
import cn.qihangerp.api.domain.bo.TenantBo;
import cn.qihangerp.api.service.OmsTenantService;
import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@AllArgsConstructor
@RequestMapping("/tenant")
@RestController
public class TenantController extends BaseController {
    private final OmsTenantService tenantService;

    @GetMapping("/list")
    public TableDataInfo list(TenantBo bo, PageQuery pageQuery)
    {
        PageResult<OmsTenant> pageResult = tenantService.queryPageList(bo, pageQuery);
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
    public AjaxResult add(@RequestBody OmsTenant tenant)
    {
        OmsTenant scmDistributor = tenantService.selectTenantByUserName(tenant.getUserName());
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
    public AjaxResult edit(@RequestBody OmsTenant shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(tenantService.updateById(shop));
    }
}
