package cn.qihangerp.store.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.order.domain.ShopOrder;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.domain.OmsShopPullLasttime;
import cn.qihangerp.model.shop.domain.OmsShopPullLogs;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import cn.qihangerp.model.shop.service.OmsShopPullLasttimeService;
import cn.qihangerp.model.shop.service.OmsShopPullLogsService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.dou.DouOrderApiHelper;
import cn.qihangerp.open.pdd.PddOrderApiHelper;
import cn.qihangerp.open.pdd.model.OrderListResultVo;
import cn.qihangerp.open.wei.WeiOrderApiHelper;
import cn.qihangerp.open.wei.model.Order;
import cn.qihangerp.open.wei.model.OrderDetailDeliverInfoAddress;
import cn.qihangerp.sdk.pdd.PullRequest;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Slf4j
@RequestMapping("/order")
@RestController
@AllArgsConstructor
public class OrderApiController extends BaseController {

    private final OmsMerchantShopService shopService;
    private final ShopOrderService orderService;
    private final ShopOrderService weiOrderService;
    private final OmsShopPullLogsService pullLogsService;
    private final OmsShopPullLasttimeService pullLasttimeService;
    /**
     * 拉取订单
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_order", method = RequestMethod.POST)
    public AjaxResult pullOrder(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error("参数错误，没有店铺Id");
        }
        OmsMerchantShop shop = shopService.getById(params.getShopId());
        if(shop==null) return AjaxResult.error("店铺不存在");
        if(!org.springframework.util.StringUtils.hasText(shop.getAppkey())) {
            return AjaxResult.error("店铺参数配置错误，没有找到AppKey");
        }
        if(!org.springframework.util.StringUtils.hasText(shop.getAppSercet())) {
            return AjaxResult.error("店铺参数配置错误，没有找到AppSercet");
        }
//        if(!org.springframework.util.StringUtils.hasText(shop.getServerUrl())) {
//            return AjaxResult.error("店铺参数配置错误，没有找到ApiRequestUrl");
//        }
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = 0l;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0l;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        // 定义格式化器
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        ZoneId zoneId = ZoneId.of("Asia/Shanghai");
        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime endTime = null;
        OmsShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(getUserId(), params.getShopId(), "ORDER");
        if (lasttime == null) {
            endTime = LocalDateTime.now(zoneId);
            startTime = endTime.minusDays(1);
        } else {
            startTime = lasttime.getLasttime().minusHours(1);//取上次结束一个小时前
            endTime = startTime.plusDays(1);//取24小时
            if (endTime.isAfter(LocalDateTime.now(zoneId))) {
//                endTime = LocalDateTime.now();
                endTime = LocalDateTime.now(zoneId);
            }
        }
        String pullParams = "{startTime:"+startTime.format(formatter)+",endTime:"+endTime.format(formatter)+"}";

        log.info("拉取订单,开始时间：{}====结束时间：{}", startTime.format(formatter), endTime.format(formatter));
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数


        if (shop.getType()== EnumShopType.PDD.getIndex()) {
            // 拼多多
            String accessToken = shop.getAccessToken();
            String appKey = shop.getAppkey();
            String appSecret = shop.getAppSercet();
            Long startTimestamp = startTime.toEpochSecond(ZoneOffset.ofHours(8));
            Long endTimestamp = endTime.toEpochSecond(ZoneOffset.ofHours(8));

            ApiResultVo<OrderListResultVo> upResult = PddOrderApiHelper.pullOrderList(appKey, appSecret, accessToken, startTimestamp.intValue(), endTimestamp.intValue(), 1, 20);
            if (upResult.getCode() == 10019) return AjaxResult.error(1401, upResult.getMsg());
            else if (upResult.getCode() != 0) return AjaxResult.error(upResult.getCode(), upResult.getMsg());
            if (upResult.getCode() != 0){
                OmsShopPullLogs logs = new OmsShopPullLogs();
                logs.setMerchantId(merchantId);
                logs.setShopType(shop.getType());
                logs.setShopId(shop.getId());
                logs.setPullType("ORDER");
                logs.setPullWay("主动拉取");
                logs.setPullParams(pullParams);
                logs.setPullResult(upResult.getMsg());
                logs.setPullTime(currDateTime);
                logs.setDuration(System.currentTimeMillis() - beginTime);
                pullLogsService.save(logs);
            }else {
                // 拉取成功
                //循环插入订单数据到数据库
                for (var trade : upResult.getData().getOrderList()) {
                    ShopOrder order = new ShopOrder();
                    order.setTenantId(shop.getTenantId());
                    order.setShopId(params.getShopId());
                    order.setShopType(shop.getType());
                    order.setOrderId(trade.getOrderSn());
                    order.setOpenid(trade.getOpen_address_id());
                    // 转换时间
                    // 将时间字符串转换为 LocalDateTime
                    LocalDateTime orderTime = LocalDateTime.parse(trade.getCreatedTime(), formatter);
                    // 将 LocalDateTime 转换为中国时区的 ZonedDateTime
                    Long orderTimeSec = orderTime.atZone(ZoneId.of("Asia/Shanghai")).toInstant().getEpochSecond();
                    LocalDateTime orderUpdateTime = LocalDateTime.parse(trade.getUpdatedAt(), formatter);
                    Long orderUpdateTimeSec = orderUpdateTime.atZone(ZoneId.of("Asia/Shanghai")).toInstant().getEpochSecond();
                    order.setCreateTime(orderTimeSec.intValue());
                    order.setUpdateTime(orderUpdateTimeSec.intValue());
                    //状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
                    //发货状态，枚举值：1：待发货，2：已发货待签收，3：已签收
                    if(trade.getOrderStatus()==1){
                        order.setStatus(20);
                    }else if(trade.getOrderStatus()==2){
                        order.setStatus(30);
                    } else if (trade.getOrderStatus()==3) {
                        order.setStatus(100);
                    }
                    //退款状态，枚举值：1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功
                    if(trade.getRefundStatus()!=1){
                        order.setStatus(200);
                    }
                    order.setRefundStatus(trade.getRefundStatus());
                    order.setProductPrice(BigDecimal.valueOf(trade.getGoodsAmount()*100).intValue());
                    order.setFreight(BigDecimal.valueOf(trade.getPostage()*100).intValue());
                    //优惠金额
                    order.setDiscountedPrice(BigDecimal.valueOf(trade.getDiscountAmount()*100).intValue());
                    order.setPlatformDiscount(BigDecimal.valueOf(trade.getPlatformDiscount()*100).intValue());
                    order.setSellerDiscount(BigDecimal.valueOf(trade.getSellerDiscount()*100).intValue());
                    order.setPayAmount(BigDecimal.valueOf(trade.getPayAmount()*100).intValue());
                    Integer orderAmount = order.getProductPrice()+order.getFreight()-order.getSellerDiscount();
                    order.setOrderPrice(orderAmount);
                    order.setReceiverName(trade.getReceiverName());
                    order.setReceiverAddress(trade.getReceiverAddress());
                    order.setReceiverPhone(trade.getReceiverPhone());
                    order.setUserName(trade.getReceiverNameMask());
                    order.setTelNumber(trade.getReceiverPhoneMask());
                    order.setProvinceName(trade.getProvince());
                    order.setCityName(trade.getCity());
                    order.setCountyName(trade.getTown());
                    order.setDetailInfo(trade.getReceiverAddressMask());

                    order.setConfirmStatus(1);
                    order.setConfirmTime(DateUtils.parseDate(trade.getConfirmTime()));
                    order.setErpSendStatus(0);
                    order.setCreateOn(new Date());
                    order.setBuyerMemo(trade.getBuyerMemo());
                    order.setRemark(trade.getRemark());
                    List<ShopOrderItem> itemList = new ArrayList<>();
                    for (var item:trade.getItemList()) {
                        ShopOrderItem oi = new ShopOrderItem();
                        oi.setTenantId(order.getTenantId());
                        oi.setOrderId(order.getOrderId());
                        oi.setShopId(Long.parseLong(shop.getId()));
                        oi.setShopType(shop.getType());
                        oi.setProductId(item.getGoodsId()+"");
                        oi.setSkuId(item.getSkuId()+"");
                        oi.setThumbImg(item.getGoodsImg());
                        oi.setSkuCnt(item.getGoodsCount());
                        oi.setSalePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
                        oi.setTitle(item.getGoods_name());
                        oi.setOnAftersaleSkuCnt(0);
                        oi.setFinishAftersaleSkuCnt(0);
                        oi.setSkuCode(item.getOuterId());
                        oi.setSkuAttrs(item.getGoodsSpec());
                        oi.setOutSkuId(item.getOuterId());
                        oi.setOutProductId(item.getOuterGoodsId());
                        oi.setMarketPrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
                        oi.setRealPrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
                        oi.setIsDiscounted("false");
                        oi.setEstimatePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
                        oi.setIsChangePrice("false");
                        oi.setChangePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());

                        itemList.add(oi);
                    }
                    order.setItems(itemList);
                    var result = weiOrderService.saveOrder(params.getShopId(), order);
                    if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                        //已经存在
                        hasExistOrder++;
                        String[] ids = new String[]{result.getData().toString()};
                        ResultVo<Integer> resultVo = orderService.orderConfirm(ids);
                        log.info("======店铺订单同步更新OMS订单库====={}", JSONObject.toJSONString(resultVo));
                    } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        insertSuccess++;
                        String[] ids = new String[]{result.getData().toString()};
                        ResultVo<Integer> resultVo = orderService.orderConfirm(ids);
                        log.info("======店铺订单新增到OMS订单库====={}", JSONObject.toJSONString(resultVo));
                    } else {
                        totalError++;
                    }
                }
            }


        }
        else {
            return AjaxResult.error("不支持的店铺类型！");
        }

        // 更新时间
        if (lasttime == null) {
            // 新增
            OmsShopPullLasttime insertLasttime = new OmsShopPullLasttime();
            insertLasttime.setMerchantId(shop.getMerchantId());
            insertLasttime.setShopType(shop.getType());
            insertLasttime.setShopId(shop.getId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime);
            insertLasttime.setPullType("ORDER");
            pullLasttimeService.save(insertLasttime);

        } else {
            // 修改
            OmsShopPullLasttime updateLasttime = new OmsShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime);
            pullLasttimeService.updateById(updateLasttime);
        }

        OmsShopPullLogs logs = new OmsShopPullLogs();
        logs.setMerchantId(merchantId);
        logs.setShopType(shop.getType());
        logs.setShopId(shop.getId());
        logs.setPullType("ORDER");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{startTime:" + startTime + ",endTime:" + endTime + "}");
        logs.setPullResult("{insert:" + insertSuccess + ",update:" + hasExistOrder + ",fail:" + totalError + "}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);


        Map<String, Object> data = new HashMap<>();
        data.put("startTime", startTime.format(formatter));
        data.put("endTime", endTime.format(formatter));
        data.put("insert", insertSuccess);
        data.put("update", hasExistOrder);
        data.put("fail", totalError);
        data.put("total", insertSuccess + hasExistOrder+totalError);
        return AjaxResult.success(data);
    }

    /**
     * 拉取订单详情
     * @param params
     * @return
     * @throws Exception
     */
//    @RequestMapping(value = "/pull_detail", method = RequestMethod.POST)
//    public AjaxResult pullDetail(@RequestBody PullRequest params) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if (StringUtils.isEmpty(params.getOrderId())) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有订单编号");
//        }
//        Shop shop = shopService.getById(params.getShopId());
//        if(shop==null) return AjaxResult.error("店铺不存在");
//
//        Date currDateTime = new Date();
//        long beginTime = System.currentTimeMillis();
//        if(shop.getType()==5) {
//            var checkResult = weiApiCommon.checkBefore(params.getShopId());
//            if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
//                return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//            }
//            String accessToken = checkResult.getData().getAccessToken();
////        String serverUrl = checkResult.getData().getServerUrl();
//            String appKey = checkResult.getData().getAppKey();
//            String appSecret = checkResult.getData().getAppSecret();
//
//            ApiResultVo<Order> apiResultVo = WeiOrderApiHelper.pullOrderDetail(Long.parseLong(params.getOrderId()), accessToken);
//            if (apiResultVo.getCode() == 0) {
//                if (apiResultVo.getData() != null) {
//
//                    ShopOrder order = new ShopOrder();
//                    order.setOrderId(apiResultVo.getData().getOrder_id());
////                order.setShopId(params.getShopId());
//                    order.setOpenid(apiResultVo.getData().getOpenid());
//                    order.setCreateTime(apiResultVo.getData().getCreate_time());
//                    order.setUpdateTime(apiResultVo.getData().getUpdate_time());
//                    order.setUnionid(apiResultVo.getData().getUnionid());
//                    order.setStatus(apiResultVo.getData().getStatus());
//                    //枚举值	描述
//                    //10	待付款
//                    //12	礼物待收下
//                    //13	凑单买凑团中
//                    //20	待发货
//                    //21	部分发货
//                    //30	待收货
//                    //100	完成
//                    //200	全部商品售后之后，订单取消
//                    //250	未付款用户主动取消或超时未付款订单自动取消
//                    if(apiResultVo.getData().getStatus().intValue() ==200 || apiResultVo.getData().getStatus().intValue() ==250) {
//                        order.setRefundStatus(4);
//                    }else{
//                        order.setRefundStatus(1);
//                    }
//                    order.setAftersaleDetail(JSONObject.toJSONString(apiResultVo.getData().getAftersale_detail()));
//                    order.setPayInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getPay_info()));
//                    order.setProductPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("product_price"));
//                    order.setOrderPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("order_price"));
//                    order.setFreight(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("freight"));
//                    order.setDiscountedPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("discounted_price"));
//                    order.setPayAmount(order.getOrderPrice());
//                    OrderDetailDeliverInfoAddress addressInfo = apiResultVo.getData().getOrder_detail().getDelivery_info().getAddress_info();
//
//                    order.setUserName(addressInfo.getUser_name());
//                    order.setPostalCode(addressInfo.getPostal_code());
//                    order.setProvinceName(addressInfo.getProvince_name());
//                    order.setCityName(addressInfo.getCity_name());
//                    order.setCountyName(addressInfo.getCounty_name());
//                    order.setDetailInfo(addressInfo.getDetail_info());
//                    order.setTelNumber(addressInfo.getTel_number());
//                    order.setHouseNumber(addressInfo.getHouse_number());
//                    order.setVirtualOrderTelNumber(addressInfo.getVirtual_order_tel_number());
//                    order.setTelNumberExtInfo(JSONObject.toJSONString(addressInfo.getTel_number_ext_info()));
//                    order.setUseTelNumber(addressInfo.getUse_tel_number());
//                    order.setHashCode(addressInfo.getHash_code());
//
//                    order.setDeliveryProductInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getDelivery_info().getDelivery_product_info()));
//
//                    order.setShipDoneTime(apiResultVo.getData().getOrder_detail().getDelivery_info().getShip_done_time());
//                    order.setEwaybillOrderCode(apiResultVo.getData().getOrder_detail().getDelivery_info().getEwaybill_order_code());
//
//                    order.setSettleInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getSettle_info()));
//
//                    List<ShopOrderItem> itemList = new ArrayList<>();
//                    for (var item : apiResultVo.getData().getOrder_detail().getProduct_infos()) {
//                        ShopOrderItem oi = new ShopOrderItem();
//                        oi.setShopOrderId(order.getOrderId());
//                        oi.setShopId(params.getShopId());
//                        oi.setProductId(item.getProduct_id());
//                        oi.setSkuId(item.getSku_id());
//                        oi.setThumbImg(item.getThumb_img());
//                        oi.setSkuCnt(item.getSku_cnt());
//                        oi.setSalePrice(item.getSale_price());
//                        oi.setTitle(item.getTitle());
//                        oi.setOnAftersaleSkuCnt(item.getOn_aftersale_sku_cnt());
//                        oi.setFinishAftersaleSkuCnt(item.getFinish_aftersale_sku_cnt());
//                        oi.setSkuCode(item.getSku_code());
//                        oi.setMarketPrice(item.getMarket_price());
//                        oi.setRealPrice(item.getReal_price());
//                        oi.setOutProductId(item.getOut_product_id());
//                        oi.setOutSkuId(item.getOut_sku_id());
//                        oi.setIsDiscounted(item.getIs_discounted() + "");
//                        oi.setEstimatePrice(item.getEstimate_price());
//                        oi.setIsChangePrice(item.getIs_change_price() + "");
//                        oi.setChangePrice(item.getChange_price());
//                        oi.setOutWarehouseId(item.getOut_warehouse_id());
//                        oi.setUseDeduction(item.getUse_deduction() + "");
//
//                        oi.setSkuAttrs(JSONObject.toJSONString(item.getSku_attrs()));
//                        oi.setSkuDeliverInfo(JSONObject.toJSONString(item.getSku_deliver_info()));
//                        oi.setExtraService(JSONObject.toJSONString(item.getExtra_service()));
//                        oi.setOrderProductCouponInfoList(JSONObject.toJSONString(item.getOrder_product_coupon_info_list()));
//                        itemList.add(oi);
//                    }
//                    order.setItems(itemList);
//                    ResultVo<Long> result = weiOrderService.saveOrder(params.getShopId(), order);
//                    String[] ids = new String[]{result.getData().toString()};
//                    ResultVo<Integer> resultVo = orderService.orderConfirm(ids);
//                    log.info("======店铺订单同步更新OMS订单库====={}", JSONObject.toJSONString(resultVo));
//                }
//            }
//        }else if (shop.getType()==3) {
//            // 拼多多
//            var checkResult = pddApiCommon.checkBefore(params.getShopId());
//            if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
////            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//                ErpShopPullLogs logs = new ErpShopPullLogs();
//                logs.setTenantId(shop.getTenantId());
//                logs.setShopType(shop.getType());
//                logs.setShopId(Long.parseLong(shop.getId()));
//                logs.setPullType("ORDER");
//                logs.setPullWay("主动拉取");
//                logs.setPullParams("{orderSn:" + params.getOrderId() + "}");
//                logs.setPullResult(checkResult.getMsg());
//                logs.setPullTime(currDateTime);
//                logs.setDuration(System.currentTimeMillis() - beginTime);
//                pullLogsService.save(logs);
//                return AjaxResult.error(500, checkResult.getMsg());
//            }
//            String accessToken = checkResult.getData().getAccessToken();
////        String serverUrl = checkResult.getData().getServerUrl();
//            String appKey = checkResult.getData().getAppKey();
//            String appSecret = checkResult.getData().getAppSecret();
//
//
//            ApiResultVo<cn.qihangerp.open.pdd.model.Order> upResult = PddOrderApiHelper.pullOrderDetail(appKey, appSecret, accessToken, params.getOrderId());
//            if (upResult.getCode() == 10019) return AjaxResult.error(1401, upResult.getMsg());
//            else if (upResult.getCode() != 0) return AjaxResult.error(upResult.getCode(), upResult.getMsg());
//            if (upResult.getCode() != 0) {
//                ErpShopPullLogs logs = new ErpShopPullLogs();
//                logs.setTenantId(shop.getTenantId());
//                logs.setShopType(shop.getType());
//                logs.setShopId(Long.parseLong(shop.getId()));
//                logs.setPullType("ORDER");
//                logs.setPullWay("主动拉取");
//                logs.setPullParams("{orderSn:" + params.getOrderId() + "}");
//                logs.setPullResult(upResult.getMsg());
//                logs.setPullTime(currDateTime);
//                logs.setDuration(System.currentTimeMillis() - beginTime);
//                pullLogsService.save(logs);
//            } else {
//                var trade = upResult.getData();
//                ShopOrder order = new ShopOrder();
//                order.setTenantId(shop.getTenantId());
//                order.setShopId(params.getShopId());
//                order.setShopType(shop.getType());
//                order.setOrderId(trade.getOrderSn());
//                order.setOpenid(trade.getOpen_address_id());
//                // 定义格式化器
//                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//                // 将时间字符串转换为 LocalDateTime
//                LocalDateTime orderTime = LocalDateTime.parse(trade.getCreatedTime(), formatter);
//                // 将 LocalDateTime 转换为中国时区的 ZonedDateTime
//                Long orderTimeSec = orderTime.atZone(ZoneId.of("Asia/Shanghai")).toInstant().getEpochSecond();
//                LocalDateTime orderUpdateTime = LocalDateTime.parse(trade.getUpdatedAt(), formatter);
//                Long orderUpdateTimeSec = orderUpdateTime.atZone(ZoneId.of("Asia/Shanghai")).toInstant().getEpochSecond();
//                order.setCreateTime(orderTimeSec.intValue());
//                order.setUpdateTime(orderUpdateTimeSec.intValue());
//                //状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
//                //发货状态，枚举值：1：待发货，2：已发货待签收，3：已签收
//                if(trade.getOrderStatus()==1){
//                    order.setStatus(20);
//                }else if(trade.getOrderStatus()==2){
//                    order.setStatus(30);
//                } else if (trade.getOrderStatus()==3) {
//                    order.setStatus(100);
//                }
//                //退款状态，枚举值：1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功
//                if(trade.getRefundStatus()!=1){
//                    order.setStatus(200);
//                }
//                order.setRefundStatus(trade.getRefundStatus());
//                order.setProductPrice(BigDecimal.valueOf(trade.getGoodsAmount()*100).intValue());
//                order.setFreight(BigDecimal.valueOf(trade.getPostage()*100).intValue());
//                //优惠金额
//                order.setDiscountedPrice(BigDecimal.valueOf(trade.getDiscountAmount()*100).intValue());
//                order.setPlatformDiscount(BigDecimal.valueOf(trade.getPlatformDiscount()*100).intValue());
//                order.setSellerDiscount(BigDecimal.valueOf(trade.getSellerDiscount()*100).intValue());
//                Integer orderAmount = order.getProductPrice()+order.getFreight()-order.getSellerDiscount();
//                order.setOrderPrice(orderAmount);
//                order.setBuyerMemo(trade.getBuyerMemo());
//                order.setRemark(trade.getRemark());
//                order.setReceiverName(trade.getReceiverName());
//                order.setReceiverAddress(trade.getReceiverAddress());
//                order.setReceiverPhone(trade.getReceiverPhone());
//                order.setUserName(trade.getReceiverNameMask());
//                order.setTelNumber(trade.getReceiverPhoneMask());
//                order.setProvinceName(trade.getProvince());
//                order.setCityName(trade.getCity());
//                order.setCountyName(trade.getTown());
//                order.setDetailInfo(trade.getAddressMask());
//                order.setConfirmStatus(1);
//                order.setConfirmTime(DateUtils.parseDate(trade.getConfirmTime()));
//                order.setErpSendStatus(0);
//                order.setCreateOn(new Date());
////                order.set(trade.getBuyerMemo())
//                List<ShopOrderItem> itemList = new ArrayList<>();
//                for (var item:trade.getItemList()) {
//                    ShopOrderItem oi = new ShopOrderItem();
//                    oi.setTenantId(order.getTenantId());
//                    oi.setOrderId(order.getOrderId());
//                    oi.setShopId(Long.parseLong(shop.getId()));
//                    oi.setShopType(shop.getType());
//                    oi.setProductId(item.getGoodsId()+"");
//                    oi.setSkuId(item.getSkuId()+"");
//                    oi.setThumbImg(item.getGoodsImg());
//                    oi.setSkuCnt(item.getGoodsCount());
//                    oi.setSalePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
//                    oi.setTitle(item.getGoods_name());
//                    oi.setOnAftersaleSkuCnt(0);
//                    oi.setFinishAftersaleSkuCnt(0);
//                    oi.setSkuCode(item.getOuterId());
//                    oi.setSkuAttrs(item.getGoodsSpec());
//                    oi.setOutSkuId(item.getOuterId());
//                    oi.setOutProductId(item.getOuterGoodsId());
//                    oi.setMarketPrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
//                    oi.setRealPrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
//                    oi.setIsDiscounted("false");
//                    oi.setEstimatePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
//                    oi.setIsChangePrice("false");
//                    oi.setChangePrice(BigDecimal.valueOf(item.getGoodsPrice()*100).intValue());
//
//                    itemList.add(oi);
//                }
//                order.setItems(itemList);
//                ResultVo<Long> result = weiOrderService.saveOrder(params.getShopId(), order);
//                String[] ids = new String[]{result.getData().toString()};
//                ResultVo<Integer> resultVo = orderService.orderConfirm(ids);
//                log.info("======店铺订单同步更新OMS订单库====={}", JSONObject.toJSONString(resultVo));
//            }
//        }
//
//        return AjaxResult.success();
//    }
}


