package cn.qihangerp.mms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.order.bo.OrderQuery;
import cn.qihangerp.model.order.domain.ScmOrder;
import cn.qihangerp.model.order.domain.ScmOrderItem;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.model.shop.service.OmsTenantShopGoodsSkuService;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 店铺订单Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController
{

    @Autowired
    private OmsMerchantShopService shopService;
    @Autowired
    private OmsTenantShopGoodsSkuService goodsSkuService;

    /**
     * 查询店铺订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(OrderQuery query, PageQuery pageQuery)
    {
//        query.setTenantId(SecurityUtils.getUserId());
//        PageResult<ScmOrder> pageResult = orderService.queryPageList(query,pageQuery);
        return getDataTable(new ArrayList<>());
    }


    /**
     * 获取店铺订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(shopService.getById(id));
//        return success(orderService.getById(id));
    }

    /**
     * 新增店铺订单
     */
    @PostMapping
    public AjaxResult add(@RequestBody ScmOrder order)
    {
        if(order.getShopId()==null) return AjaxResult.error("请选择店铺");
        OmsMerchantShop shop = shopService.getById(order.getShopId());
        if(shop==null) return AjaxResult.error("店铺不存在");

        if(order.getItemList() == null || order.getItemList().size() == 0) return AjaxResult.error("请添加订单商品");
        else{
            // 循环查找是否缺少skuId
            for (ScmOrderItem orderItem : order.getItemList())
            {
                if(orderItem.getSkuId()==null || orderItem.getSkuId()<=0) return AjaxResult.error("请选择订单商品规格");
                orderItem.setPlatformSkuId(orderItem.getSkuId());
                // 店铺商品表查询商品供应链信息
                List<OmsTenantShopGoodsSku> shopGoodsSkuList = goodsSkuService.list(new LambdaQueryWrapper<OmsTenantShopGoodsSku>()
                        .eq(OmsTenantShopGoodsSku::getSkuId, orderItem.getSkuId())
                        .eq(OmsTenantShopGoodsSku::getShopId, order.getShopId())
                        .eq(OmsTenantShopGoodsSku::getTenantId, SecurityUtils.getUserId())
                );
                if(shopGoodsSkuList == null || shopGoodsSkuList.size()==0) return AjaxResult.error("没有找到店铺商品");
                if(shopGoodsSkuList.get(0).getErpGoodsId()==null||shopGoodsSkuList.get(0).getErpGoodsId()==0)return AjaxResult.error("店铺商品没有关联供应链商品，无法下单！");
                if(shopGoodsSkuList.get(0).getErpGoodsSpecId()==null||shopGoodsSkuList.get(0).getErpGoodsSpecId()==0)return AjaxResult.error("店铺商品没有关联供应链商品，无法下单！");
                orderItem.setErpGoodsId(shopGoodsSkuList.get(0).getErpGoodsId());
                orderItem.setErpGoodsSpecId(shopGoodsSkuList.get(0).getErpGoodsSpecId());
            }
        }

        order.setShopType(shop.getType());
        order.setTenantId(SecurityUtils.getUserId());
//        if(order.getGoodsAmount()==null)return new AjaxResult(1503,"请填写商品价格！");
        order.setCreateBy(SecurityUtils.getUsername());
//        int result = orderService.insertOrder(order);
//        if(result == -1) return new AjaxResult(501,"订单号已存在！");
//        if(result == -2) return new AjaxResult(502,"请添加订单商品！");
//        if(result == -3) return new AjaxResult(503,"请选择订单商品规格！");
//        if(result == -4) return new AjaxResult(504,"请选择店铺！");
//        if(result == -5) return new AjaxResult(505,"TenantId不能为空！");
//        if(result == -6) return new AjaxResult(505,"店铺不能为空！");
//        if(result == -11) return new AjaxResult(511,"商品数据错误：缺少供应链商品ID");
//        if(result == -12) return new AjaxResult(512,"商品数据错误：缺少供应链skuId");
        return AjaxResult.success();
    }

    /**
     * 订单发货(发货操作移到erpShipOrder中)
     * @param order
     * @return
     */
//    @Log(title = "店铺订单", businessType = BusinessType.UPDATE)
//    @PostMapping("/ship")
//    public AjaxResult ship(@RequestBody ErpOrder order)
//    {
//        order.setUpdateBy(getUsername());
//        int result = orderService.shipErpOrder(order);
//        if(result == -1) return new AjaxResult(501,"订单不存在！");
//        else if(result == -2) return new AjaxResult(502,"订单状态不对！无法发货！");
//        else if(result == -3) return new AjaxResult(502,"订单发货状态不对！无法发货！");
//        return toAjax(result);
//    }

}
