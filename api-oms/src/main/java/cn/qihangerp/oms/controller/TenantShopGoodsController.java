package cn.qihangerp.oms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.interfaces.order.bo.OrderQuery;
import cn.qihangerp.interfaces.order.domain.ScmOrder;
import cn.qihangerp.interfaces.order.service.ScmPlatformService;
import cn.qihangerp.oms.domain.OmsTenantShop;
import cn.qihangerp.oms.domain.OmsTenantShopGoods;
import cn.qihangerp.oms.domain.bo.ShopGoodsQuery;
import cn.qihangerp.oms.security.SecurityUtils;
import cn.qihangerp.oms.service.OmsTenantShopGoodsService;
import cn.qihangerp.oms.service.OmsTenantShopGoodsSkuService;
import cn.qihangerp.oms.service.OmsTenantShopService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/tenant")
public class TenantShopGoodsController extends BaseController {
    @Autowired
    private OmsTenantShopGoodsService goodsService;


    @GetMapping("/shop_goods/list")
    public TableDataInfo list(ShopGoodsQuery query, PageQuery pageQuery)
    {
        query.setTenantId(SecurityUtils.getUserId());
        PageResult<OmsTenantShopGoods> pageResult = goodsService.queryPageList(query,pageQuery);
        return getDataTable(pageResult);
    }

    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/shop_goods/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(goodsService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("/shop_goods")
    public AjaxResult add(@RequestBody OmsTenantShopGoods goods)
    {
        goods.setTenantId(SecurityUtils.getUserId());
        goods.setCreateTime(new Date());
        return toAjax(goodsService.save(goods));
    }

    /**
     * 修改店铺
     */
    @PutMapping("/shop_goods")
    public AjaxResult edit(@RequestBody OmsTenantShopGoods goods)
    {
        goods.setUpdateTime(new Date());
        return toAjax(goodsService.updateById(goods));
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/shop_goods/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
//        List<OmsTenantShop> list = new ArrayList<>();
//        if(ids!=null && ids.length>0) {
//            for (var id:ids) {
//                OmsTenantShop shop = new OmsTenantShop();
//                shop.setId(id);
//                shop.setUpdateTime(new Date());
//                shop.setIsDelete(1);
//                list.add(shop);
//            }
//        }
//        goodsService.updateBatchById(list);
        return toAjax(1);
    }

    @GetMapping("/shop_goods/sku_list")
    public TableDataInfo platformList()
    {
        return getDataTable(new ArrayList<>());
    }
}
