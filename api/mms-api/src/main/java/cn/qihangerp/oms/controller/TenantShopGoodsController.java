package cn.qihangerp.oms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.oms.domain.OmsTenantShopGoods;
import cn.qihangerp.oms.domain.bo.ShopGoodsQuery;
import cn.qihangerp.oms.domain.vo.GoodsSpecListVo;
import cn.qihangerp.oms.security.SecurityUtils;
import cn.qihangerp.oms.service.OmsTenantShopGoodsService;
import cn.qihangerp.oms.service.OmsTenantShopGoodsSkuService;
import cn.qihangerp.oms.service.OmsTenantShopService;

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
    @Autowired
    private OmsTenantShopGoodsSkuService goodsSkuService;


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
        if(goods.getSkuList()==null||goods.getSkuList().size()==0) return AjaxResult.error("请添加SKU");
        for(var sku : goods.getSkuList()){
            if(sku.getSkuId()==null) {
                return AjaxResult.error("请填写SKU内容");
            }
        }
        goods.setTenantId(SecurityUtils.getUserId());
        goods.setCreateTime(new Date());
        var result = goodsService.addShopGoods(goods);
        if(result.getCode()==0) return AjaxResult.success();
        else return AjaxResult.error(result.getMsg());
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/shop_goods/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        goodsService.delShopGoods(ids,SecurityUtils.getUserId());
        return AjaxResult.success();
    }

    @GetMapping("/shop_goods/sku_list")
    public TableDataInfo platformList()
    {
        return getDataTable(new ArrayList<>());
    }

    /**
     * 搜索商品SKU
     * 条件：商品编码、SKU、商品名称
     */
    @GetMapping("/shop_goods/searchSku")
    public TableDataInfo searchSkuBy(String keyword,Long shopId)
    {
        List<GoodsSpecListVo> list = goodsSkuService.searchGoodsSpec(keyword,shopId,SecurityUtils.getUserId());
        return getDataTable(list);
    }
}
