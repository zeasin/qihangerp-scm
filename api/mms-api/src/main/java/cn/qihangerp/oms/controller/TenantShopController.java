package cn.qihangerp.oms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.model.order.service.ScmPlatformService;
import cn.qihangerp.oms.domain.OmsTenantShop;
import cn.qihangerp.oms.security.SecurityUtils;
import cn.qihangerp.oms.service.OmsTenantShopService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/tenant")
public class TenantShopController extends BaseController {
    @Autowired
    private OmsTenantShopService shopService;
    @Autowired
    private ScmPlatformService platformService;

    @GetMapping("/shop/list")
    public TableDataInfo list()
    {
        List<OmsTenantShop> list = shopService.list(new LambdaQueryWrapper<OmsTenantShop>()
                .eq(OmsTenantShop::getTenantId, SecurityUtils.getUserId())
                .eq(OmsTenantShop::getIsDelete,0)
        );

        return getDataTable(list);
    }

    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/shop/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody OmsTenantShop shop)
    {
        shop.setTenantId(SecurityUtils.getUserId());
        shop.setCreateTime(new Date());
        return toAjax(shopService.save(shop));
    }

    /**
     * 修改店铺
     */
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody OmsTenantShop shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(shopService.updateById(shop));
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/shop/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<OmsTenantShop> list = new ArrayList<>();
        if(ids!=null && ids.length>0) {
            for (var id:ids) {
                OmsTenantShop shop = new OmsTenantShop();
                shop.setId(id);
                shop.setUpdateTime(new Date());
                shop.setIsDelete(1);
                list.add(shop);
            }
        }
        shopService.updateBatchById(list);
        return toAjax(1);
    }

    @GetMapping("/platform/list")
    public TableDataInfo platformList()
    {
        return getDataTable(platformService.list());
    }
}
