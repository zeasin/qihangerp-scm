package cn.qihangerp.mms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.shop.service.ErpShopPlatformService;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/shop")
public class ShopController extends BaseController {
    @Autowired
    private OmsMerchantShopService shopService;
    @Autowired
    private ErpShopPlatformService platformService;

    @GetMapping("/list")
    public TableDataInfo list()
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = null;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0L;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }

        List<OmsMerchantShop> list = shopService.list(new LambdaQueryWrapper<OmsMerchantShop>()
                .eq(OmsMerchantShop::getMerchantId, merchantId)
                .eq(OmsMerchantShop::getStatus,0)
        );

        return getDataTable(list);
    }

    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("")
    public AjaxResult add(@RequestBody OmsMerchantShop shop)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = null;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0L;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        shop.setStatus(0);
        shop.setApiStatus(0);
        shop.setMerchantId(merchantId);
        shop.setCreateTime(new Date());
        return toAjax(shopService.save(shop));
    }

    /**
     * 修改店铺
     */
    @PutMapping("")
    public AjaxResult edit(@RequestBody OmsMerchantShop shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(shopService.updateById(shop));
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<OmsMerchantShop> list = new ArrayList<>();
        if(ids!=null && ids.length>0) {
            for (var id:ids) {
                OmsMerchantShop shop = new OmsMerchantShop();
                shop.setId(id);
                shop.setUpdateTime(new Date());
                shop.setStatus(1);
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
