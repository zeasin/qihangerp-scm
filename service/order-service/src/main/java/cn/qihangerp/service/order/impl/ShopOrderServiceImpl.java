package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.utils.DateUtils;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.model.order.bo.ShopOrderQueryBo;
import cn.qihangerp.model.order.domain.ShopOrderItem;
import cn.qihangerp.service.goods.mapper.ShopGoodsMapper;
import cn.qihangerp.service.goods.mapper.ShopGoodsSkuMapper;
import cn.qihangerp.service.order.mapper.ShopOrderItemMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.ShopOrder;
import cn.qihangerp.model.order.service.ShopOrderService;
import cn.qihangerp.service.order.mapper.ShopOrderMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author qilip
* @description 针对表【oms_shop_order】的数据库操作Service实现
* @createDate 2025-07-20 14:58:38
*/
@AllArgsConstructor
@Service
public class ShopOrderServiceImpl extends ServiceImpl<ShopOrderMapper, ShopOrder>
    implements ShopOrderService{
    private final ShopOrderItemMapper itemMapper;
    private final ShopGoodsSkuMapper shopGoodsSkuMapper;
    private final ShopGoodsMapper shopGoodsMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    /**
     * 发货订单
     * @param bo
     * @param pageQuery
     * @return
     */
    @Override
    public PageResult<ShopOrder> queryOrderPageList(ShopOrderQueryBo bo, PageQuery pageQuery) {
        Long startTime = null;
        Long endTime = null;

        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
//                bo.setStartTime(bo.getStartTime()+" 00:00:00");
                startTime = DateUtils.parseDate(bo.getStartTime()+" 00:00:00").getTime() /1000;
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
//                bo.setEndTime(bo.getEndTime()+" 23:59:59");
                endTime = DateUtils.parseDate(bo.getEndTime()+" 23:59:59").getTime() /1000;
            }
        }
        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");


        LambdaQueryWrapper<ShopOrder> queryWrapper = new LambdaQueryWrapper<ShopOrder>()
                .eq(bo.getOrderStatus()!=null, ShopOrder::getOrderStatus,bo.getOrderStatus())
                .eq(bo.getRefundStatus()!=null, ShopOrder::getRefundStatus,bo.getRefundStatus())
                .eq(bo.getShopId()!=null, ShopOrder::getShopId,bo.getShopId())
                .eq(bo.getShopType()!=null, ShopOrder::getShopType,bo.getShopType())
                .eq(bo.getMerchantId()!=null, ShopOrder::getMerchantId,bo.getMerchantId())
                .ge(startTime!=null, ShopOrder::getOrderTime,startTime)
                .le(endTime!=null, ShopOrder::getOrderTime,endTime)
                .eq(StringUtils.hasText(bo.getOrderId()), ShopOrder::getOrderId,bo.getOrderId())
                .eq(ShopOrder::getDeliverMethod,0)
                ;

        Page<ShopOrder> orderPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        if(orderPage.getRecords()!=null){
            for (var order:orderPage.getRecords()) {
                order.setItems(itemMapper.selectList(
                        new LambdaQueryWrapper<ShopOrderItem>()
                                .eq(ShopOrderItem::getShopOrderId,order.getId()))
                );
            }
        }
        return PageResult.build(orderPage);
    }

    @Override
    public PageResult<ShopOrder> queryWaitShipOrderPageList(ShopOrderQueryBo bo, PageQuery pageQuery) {
        Long startTime = null;
        Long endTime = null;

        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
//                bo.setStartTime(bo.getStartTime()+" 00:00:00");
                startTime = DateUtils.parseDate(bo.getStartTime()+" 00:00:00").getTime() /1000;
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
//                bo.setEndTime(bo.getEndTime()+" 23:59:59");
                endTime = DateUtils.parseDate(bo.getEndTime()+" 23:59:59").getTime() /1000;
            }
        }
        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");


        LambdaQueryWrapper<ShopOrder> queryWrapper = new LambdaQueryWrapper<ShopOrder>()
//                .eq(ShopOrder::getOrderStatus,1)
                .eq( ShopOrder::getAfterSalesStatus,0)
                .eq(bo.getShopId()!=null, ShopOrder::getShopId,bo.getShopId())
                .eq(bo.getShopType()!=null, ShopOrder::getShopType,bo.getShopType())
                .eq(bo.getMerchantId()!=null, ShopOrder::getMerchantId,bo.getMerchantId())
                .ge(startTime!=null, ShopOrder::getOrderTime,startTime)
                .le(endTime!=null, ShopOrder::getOrderTime,endTime)
                .eq(StringUtils.hasText(bo.getOrderId()), ShopOrder::getOrderId,bo.getOrderId())
                .eq(ShopOrder::getDeliverMethod,0)
                ;

        Page<ShopOrder> orderPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        if(orderPage.getRecords()!=null){
            for (var order:orderPage.getRecords()) {
                order.setItems(itemMapper.selectList(
                        new LambdaQueryWrapper<ShopOrderItem>()
                                .eq(ShopOrderItem::getShopOrderId,order.getId()))
                );
            }
        }
        return PageResult.build(orderPage);
    }



    @Override
    public ShopOrder queryDetailById(Long orderId) {
        ShopOrder shopOrder = this.baseMapper.selectById(orderId);
        if(shopOrder!=null){
            shopOrder.setItems(itemMapper.selectList(
                    new LambdaQueryWrapper<ShopOrderItem>()
                            .eq(ShopOrderItem::getShopOrderId,shopOrder.getId())));

        }
        return shopOrder;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, ShopOrder order) {

        List<ShopOrder> shopOrderList = this.baseMapper.selectList(new LambdaQueryWrapper<ShopOrder>()
                .eq(ShopOrder::getOrderId, order.getOrderId())
                .eq(ShopOrder::getShopId, shopId)
        );
        Long shopOrderId=null;
        if (shopOrderList != null && shopOrderList.size() > 0) {
            // 存在，修改
            ShopOrder update = new ShopOrder();
            update.setId(shopOrderList.get(0).getId());
            update.setOrderStatus(order.getOrderStatus());
            update.setPlatformOrderStatusText(order.getPlatformOrderStatusText());
            update.setPlatformOrderStatus(order.getPlatformOrderStatus());
            update.setSellerMemo(order.getSellerMemo());
            update.setBuyerMemo(order.getBuyerMemo());
            update.setRemark(order.getRemark());
            update.setAfterSalesStatus(order.getAfterSalesStatus());
            update.setRefundStatus(order.getRefundStatus());
            update.setUpdateTime(order.getUpdateTime());
            update.setUpdateTimeText(order.getUpdateTimeText());
            update.setUpdateOn(new Date());
            this.baseMapper.updateById(update);
            shopOrderId = update.getId();
        } else {
            // 不存在，新增
            order.setCreateOn(new Date());
            this.baseMapper.insert(order);
            shopOrderId = order.getId();
        }
        // 添加订单item
        for (ShopOrderItem item : order.getItems()) {
            item.setShopId(shopId);
            item.setShopType(order.getShopType());
            item.setMerchantId(order.getMerchantId());
            if (StringUtils.hasText(item.getSkuId())) {
                List<ShopGoodsSku> shopGoodsSkuList = shopGoodsSkuMapper.selectList(new LambdaQueryWrapper<ShopGoodsSku>().eq(ShopGoodsSku::getPlatformSkuId, item.getSkuId()));
                if (shopGoodsSkuList != null) {
                    item.setErpGoodsId(shopGoodsSkuList.get(0).getErpGoodsId());
                    item.setErpGoodsSkuId(shopGoodsSkuList.get(0).getErpGoodsSkuId());
                }
            } else {
                List<ShopGoods> shopGoodsList = shopGoodsMapper.selectList(new LambdaQueryWrapper<ShopGoods>().eq(ShopGoods::getPlatformProductId, item.getProductId()));
                if (!shopGoodsList.isEmpty()) {
                    item.setErpGoodsId(shopGoodsList.get(0).getErpGoodsId());
                    item.setErpGoodsSkuId(0L);
                }
            }
            List<ShopOrderItem> orderItems = itemMapper.selectList(
                    new LambdaQueryWrapper<ShopOrderItem>()
                            .eq(ShopOrderItem::getOrderId, item.getOrderId())
                            .eq(ShopOrderItem::getProductId, item.getProductId())
                            .eq(StringUtils.hasText(item.getSkuId()), ShopOrderItem::getSkuId, item.getSkuId())
            );
            if (orderItems != null && orderItems.size() > 0) {
                // 更新
                item.setId(orderItems.get(0).getId());
                item.setShopOrderId(shopOrderId);
                item.setUpdateOn(new Date());
                itemMapper.updateById(item);
            } else {
                // 新增
                item.setShopOrderId(shopOrderId);
                item.setCreateOn(new Date());
                itemMapper.insert(item);
            }
        }

        if (shopOrderList != null && shopOrderList.size() > 0) {
            return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
        } else {
            return ResultVo.success();
        }
    }
}




