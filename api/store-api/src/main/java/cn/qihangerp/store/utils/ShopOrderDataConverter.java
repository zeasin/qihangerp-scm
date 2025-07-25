package cn.qihangerp.store.utils;

import cn.qihangerp.model.order.domain.ShopOrder;
import cn.qihangerp.model.order.domain.ShopOrderItem;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.open.pdd.model.OrderItem;
import com.alibaba.fastjson2.JSONObject;
import lombok.extern.slf4j.Slf4j;
import java.math.BigDecimal;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class ShopOrderDataConverter {
    public static ShopOrder AssemblePddOrderData(cn.qihangerp.open.pdd.model.Order trade, OmsMerchantShop shop) throws ParseException {
        ShopOrder shopOrder = new ShopOrder();
        shopOrder.setMerchantId(shop.getMerchantId());
        shopOrder.setShopId(shop.getId());
        shopOrder.setShopType(shop.getType());
        shopOrder.setOrderId(trade.getOrderSn());

        // 订单时间
        shopOrder.setOrderTimeText(trade.getCreatedTime());
        shopOrder.setUpdateTimeText(trade.getUpdatedAt());
        // 定义日期时间格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        // 解析字符串为 LocalDateTime
        LocalDateTime orderTime = LocalDateTime.parse(shopOrder.getOrderTimeText(), formatter).atZone(ZoneId.systemDefault()).toLocalDateTime();
        LocalDateTime updateTime = LocalDateTime.parse(shopOrder.getUpdateTimeText(), formatter).atZone(ZoneId.systemDefault()).toLocalDateTime();
        shopOrder.setOrderTime(orderTime.toEpochSecond(ZoneOffset.of("+8")));
        shopOrder.setUpdateTime(updateTime.toEpochSecond(ZoneOffset.of("+8")));

        // 收件人
        shopOrder.setPlatformUserId(0L);
        shopOrder.setPlatformAccount("");
        shopOrder.setReceiverNameMask(trade.getReceiverNameMask());
        shopOrder.setReceiverName(trade.getReceiverName());
        shopOrder.setReceiverPhoneMask(trade.getReceiverPhoneMask());
        shopOrder.setReceiverPhone(trade.getReceiverPhone());
        shopOrder.setReceiverAddressMask(trade.getReceiverAddressMask());
        shopOrder.setReceiverAddress(trade.getReceiverAddress());
        shopOrder.setProvince(trade.getProvince());
        shopOrder.setCity(trade.getCity());
        shopOrder.setCounty(trade.getTown());



        //订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
        //order_status	INTEGER	1	发货状态，枚举值：1：待发货，2：已发货待签收，3：已签收
        shopOrder.setOrderStatus(trade.getOrderStatus());
        //售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功
        shopOrder.setRefundStatus(trade.getRefundStatus());
        //售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中
        // 5：平台同意退款，退款中 6：驳回退款，待买家处理 7：已同意退货退款,待用户发货 8：平台处理中
        // 9：平台拒绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处理，退款失败 13：买家逾期，超过有效期
        // 14：换货补寄待商家处理 15：换货补寄待用户处理 16：换货补寄成功 17：换货补寄失败 18：换货补寄待用户确认完成 21：待商家同意维修
        // 22：待用户确认发货 24：维修关闭 25：维修成功 27：待用户确认收货 31：已同意拒收退款，待用户拒收 32：补寄待商家发货 33：同意召回后退款，待商家召回
        shopOrder.setAfterSalesStatus(trade.getAfterSalesStatus());
        shopOrder.setPlatformOrderStatus(trade.getOrderStatus()+"");
        if(trade.getOrderStatus()==1){
            shopOrder.setPlatformOrderStatusText("待发货");
        }else if(trade.getOrderStatus()==2){
            shopOrder.setPlatformOrderStatusText("已发货待签收");
        }else if(trade.getOrderStatus()==3){
            shopOrder.setPlatformOrderStatusText("已签收");
        }

        // 价格
        shopOrder.setGoodsAmount(BigDecimal.valueOf(trade.getGoodsAmount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setOrderAmount(BigDecimal.valueOf(trade.getPayAmount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setFreight(BigDecimal.valueOf(trade.getPostage()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setPaymentAmount(BigDecimal.valueOf(trade.getPayAmount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setDiscountAmount(BigDecimal.valueOf(trade.getDiscountAmount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setPlatformDiscount(BigDecimal.valueOf(trade.getPlatformDiscount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setSellerDiscount(BigDecimal.valueOf(trade.getSellerDiscount()).multiply(BigDecimal.valueOf(100)).intValue());
        shopOrder.setOrderChangeAmount(BigDecimal.valueOf(trade.getOrderChangeAmount()).multiply(BigDecimal.valueOf(100)).intValue());

        shopOrder.setSellerMemo(trade.getRemark());
        shopOrder.setBuyerMemo(trade.getBuyerMemo());
        shopOrder.setRemark("");
        shopOrder.setConfirmStatus(0);
        shopOrder.setErpShipStatus(0);
        shopOrder.setShopMemberId(0L);
        shopOrder.setDeliverMethod(0);//0普通物流1虚拟发货
        shopOrder.setEwaybillOrderCode(trade.getTrackingNumber());
        List<ShopOrderItem> items = new ArrayList<>();
        if(!trade.getItemList().isEmpty()){
            for (int i = 0; i <  trade.getItemList().size(); i++) {
                OrderItem item= trade.getItemList().get(i);

                ShopOrderItem orderItem = new ShopOrderItem();
                orderItem.setMerchantId(shopOrder.getMerchantId());
                orderItem.setShopId(shop.getId());
                orderItem.setShopType(shop.getType());
                orderItem.setOrderId(shopOrder.getOrderId());
                orderItem.setOrderTime(shopOrder.getOrderTime());
                orderItem.setProductId(item.getGoodsId()+"");
                orderItem.setSkuId(item.getSkuId()+"");
                orderItem.setQuantity(item.getGoodsCount());
                orderItem.setImg(item.getGoodsImg());
                orderItem.setTitle(item.getGoods_name());
                orderItem.setSalePrice(BigDecimal.valueOf(item.getGoodsPrice()).multiply(BigDecimal.valueOf(100)).intValue());
                orderItem.setMarketPrice(orderItem.getSalePrice());
                orderItem.setRealPrice(orderItem.getSalePrice());
                orderItem.setItemAmount(BigDecimal.valueOf(item.getGoodsPrice()).multiply(BigDecimal.valueOf(item.getGoodsCount())).multiply(BigDecimal.valueOf(100)).intValue());
                orderItem.setDiscountAmount(0);
                orderItem.setChangePrice(0);
                orderItem.setSkuName(item.getGoodsSpec());
                orderItem.setOuterProductId(item.getOuterGoodsId());
                orderItem.setOuterSkuId(item.getOuterId());
                orderItem.setIsDiscounted("false");
                orderItem.setIsChangePrice("false");
                orderItem.setOnAftersaleSkuCnt(0);
                orderItem.setFinishAftersaleSkuCnt(0);
                orderItem.setRefundStatus(shopOrder.getRefundStatus());
                orderItem.setRefundAmount(0);
                orderItem.setErpGoodsId(0L);
                orderItem.setErpGoodsSkuId(0L);

                items.add(orderItem);
            }
        }
        shopOrder.setItems(items);

        return shopOrder;
    }
}
