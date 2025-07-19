//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.common.ResultVoEnum;
//import cn.qihangerp.common.enums.EnumShopType;
//import cn.qihangerp.module.open.dou.domain.DouOrder;
//import cn.qihangerp.module.open.dou.domain.DouOrderItem;
//import cn.qihangerp.module.open.dou.domain.DouWaybillAccount;
//import cn.qihangerp.module.open.dou.service.DouOrderItemService;
//import cn.qihangerp.module.open.dou.service.DouOrderService;
//import cn.qihangerp.module.open.dou.service.OmsDouWaybillAccountService;
//import cn.qihangerp.module.order.domain.OOrderShipWaybill;
//import cn.qihangerp.module.order.domain.OOrderStocking;
//import cn.qihangerp.module.order.domain.OOrderStockingItem;
//import cn.qihangerp.module.order.service.OOrderShipWaybillService;
//import cn.qihangerp.module.order.service.OOrderStockingService;
//import cn.qihangerp.module.service.OShopPlatformService;
//import cn.qihangerp.module.service.OShopService;
//import cn.qihangerp.open.common.ApiResultVo;
//import cn.qihangerp.sdk.dou.DouLogisticsShipApiHelper;
//import cn.qihangerp.sdk.dou.DouWaybillApiHelper;
//import cn.qihangerp.sdk.dou.request.LogisticsAdd;
//import cn.qihangerp.sdk.dou.response.DouWaybillApplyResponse;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import cn.qihangerp.vms.domain.DouLogisticsAdd;
//import cn.qihangerp.vms.domain.DouLogisticsProduct;
//import cn.qihangerp.vms.request.DouApiHelper;
//import cn.qihangerp.vms.request.DouWaybillGetBo;
//import cn.qihangerp.vms.request.DouWaybillGetCodeBo;
//import cn.qihangerp.vms.response.WeiWaybillCodeVo;
//import cn.qihangerp.utils.UUID;
//import com.alibaba.fastjson2.JSONObject;
//import com.doudian.open.api.logistics_newCreateOrder.data.EbillInfosItem;
//import com.doudian.open.api.logistics_newCreateOrder.param.*;
//import com.doudian.open.api.logistics_waybillApply.param.WaybillAppliesItem;
//import com.doudian.open.api.order_logisticsAddMultiPack.param.OrderLogisticsAddMultiPackParam;
//import com.doudian.open.api.order_logisticsAddMultiPack.param.PackListItem;
//import com.doudian.open.api.order_logisticsAddMultiPack.param.ShippedOrderInfoItem;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import lombok.extern.java.Log;
//import org.springframework.beans.BeanUtils;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.*;
//import java.util.stream.Collectors;
//
//@Log
//@AllArgsConstructor
//@RestController
//@RequestMapping("/dou/ewaybill")
//public class DouWaybillController extends BaseController {
//    private final DouApiHelper apiCommon;
//    private final OmsDouWaybillAccountService waybillAccountService;
//    private final DouOrderService douOrderService;
//    private final DouOrderItemService douOrderItemService;
//    private final OOrderShipWaybillService erpShipWaybillService;
////    private final OOrderService oOrderService;
//    private final OOrderStockingService supplierShipOrderService;
//    private final OShopPlatformService platformService;
//    private final OShopService shopService;
//
//    /**
//     * 获取账户列表
//     *
//     * @return
//     * @throws Exception
//     */
//    @GetMapping(value = "/get_waybill_account_list")
//    public AjaxResult getWaybillAccountList(HttpServletRequest request) throws Exception {
////        List<OmsDouWaybillAccount> list = waybillAccountService.list(
////                new LambdaQueryWrapper<OmsDouWaybillAccount>()
//////                        .eq(OmsDouWaybillAccount::getShopId, shopId)
////                        .eq(OmsDouWaybillAccount::getIsShow, 1));
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        List<DouWaybillAccount> list = waybillAccountService.getSupplierWaybillAccountList(userId);
//        return AjaxResult.success(list);
//    }
//    @PostMapping("/get_waybill_code")
//    @ResponseBody
//    public AjaxResult getWaybillCode(@RequestBody DouWaybillGetCodeBo req) {
//        if (req.getAccountId() == null || req.getAccountId() <= 0) {
//            return AjaxResult.error( "参数错误，请选择电子面单账户");
//        }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
//        var platform = platformService.getById(EnumShopType.DOU.getIndex());
////        if (req.getShopId() == null || req.getShopId() <= 0) {
////            return AjaxResult.error( "参数错误，没有店铺Id");
////        }
////
//
//        int total = req.getIds().length;
//        int success = 0;
//        int fail = 0;
//        for (Long id : req.getIds()) {
//            OOrderStocking supplierShipOrder = supplierShipOrderService.getById(id);
//            if (supplierShipOrder != null&& supplierShipOrder.getOrderStatus()==1) {
//                String orderId = supplierShipOrder.getOrderNum();
//                if (StringUtils.hasText(orderId)) {
//                    DouOrder order = douOrderService.queryDetailByOrderId(orderId);
//                    if (order != null &&(order.getOrderStatus()==2||order.getOrderStatus()==101)) {
//
//                        var shop = shopService.selectShopById(order.getShopId());
//                        String appKey = platform.getAppKey();
//                        String appSecret = platform.getAppSecret();
//                        // 获取电子面单账户信息(包含了发货地址信息)
//                        DouWaybillAccount waybillAccount = waybillAccountService.getById(req.getAccountId());
//
//                        cn.qihangerp.sdk.dou.request.DouWaybillAccount waybillAccount1 = new cn.qihangerp.sdk.dou.request.DouWaybillAccount();
//                        BeanUtils.copyProperties(waybillAccount, waybillAccount1);
//
//                        List<OrderInfosItem> orderInfosList = new ArrayList<>();
//
//                        // 开始组装订单
//                        OrderInfosItem orderInfosItem = new OrderInfosItem();
//                        orderInfosItem.setOrderId(order.getOrderId());
//                        ReceiverInfo receiverInfo = new ReceiverInfo();
//                        Address_4_4 address44 = new Address_4_4();
//                        address44.setCountryCode("CHN");
//                        address44.setProvinceName(order.getProvinceName());
//                        address44.setCityName(order.getCityName());
//                        address44.setDistrictName(order.getTownName());
//                        address44.setDetailAddress(order.getMaskPostAddress());
//                        receiverInfo.setAddress(address44);
//                        Contact contact44 = new Contact();
//                        contact44.setName(order.getMaskPostReceiver());
//                        contact44.setMobile("-");
//                        receiverInfo.setContact(contact44);
//                        orderInfosItem.setReceiverInfo(receiverInfo);
//
//                        List<ItemsItem> itemList = new ArrayList<>();
//                        if (order.getItems() != null && order.getItems().size() > 0) {
//                            for (var it : order.getItems()) {
//                                ItemsItem item = new ItemsItem();
//                                item.setItemCount(it.getItemNum().intValue());
//                                item.setItemName(it.getProductName());
//                                item.setItemSpecs(it.getSpec());
//                                itemList.add(item);
//                            }
//                        }
//                        orderInfosItem.setItems(itemList);
//                        if (waybillAccount.getCompany().toLowerCase().equals("jd")) {
//                            orderInfosItem.setProductType("LL-HD-M");
//                            orderInfosItem.setRemark("托寄物：预制菜");
//                        }
//
//                        orderInfosList.add(orderInfosItem);
//
//
//                        ApiResultVo<EbillInfosItem> apiResultVo = DouWaybillApiHelper.getWaybillCode(appKey, appSecret, shop.getSellerId(), waybillAccount1, orderInfosList);
//
//                        if (apiResultVo.getCode() == 0) {
//                            // 保持数据
//                            for (var result : apiResultVo.getList()) {
//                                supplierShipOrder.setWaybillCode(result.getTrackNo());
//                                supplierShipOrder.setWaybillCompany(result.getCompany());
//                                // 额外打印信息（众邮、京东、丰网使用）
//                                supplierShipOrder.setPrintData(result.getExtraResp());
//                                supplierShipOrder.setWaybillOrderId(result.getOrderId());
//                                ResultVo<Long> resultVo = erpShipWaybillService.vendorWaybillCodeAndSend(supplierShipOrder,waybillAccount.getTemplateUrl(),1);
//                                if(resultVo.getCode()==0) success++;
//                                else fail++;
//                            }
//                        } else {
//                            return AjaxResult.error(apiResultVo.getMsg());
//                        }
//                    }
//                }
//            }
//        }
//
//        return success();
//    }
//
//    /**
//     * 取号并发货
//     * @param req
//     * @return
//     * @throws Exception
//     */
//    @PostMapping("/get_waybill_code_and_send")
//    @ResponseBody
//    public AjaxResult getWaybillCodeAndSend(@RequestBody DouWaybillGetCodeBo req) throws Exception {
//        if (req.getAccountId() == null || req.getAccountId() <= 0) {
//            return AjaxResult.error( "参数错误，请选择电子面单账户");
//        }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
//
//
//        int total = req.getIds().length;
//        int success = 0;
//        int fail = 0;
//        int isSend = 0;
//        WeiWaybillCodeVo vo = new WeiWaybillCodeVo();
//        vo.setTotal(total);
//        // 查出所有选择的取号订单
//        List<OOrderStocking> oOrderStockings = supplierShipOrderService.listByIds(Arrays.asList(req.getIds()));
//        if (oOrderStockings.isEmpty()) return AjaxResult.error("没有选择订单");
//
//        var platform = platformService.getById(EnumShopType.DOU.getIndex());
//        String appKey = platform.getAppKey();
//        String appSecret = platform.getAppSecret();
//        //获取电子面单账户信息(包含了发货地址信息)
//        DouWaybillAccount waybillAccount = waybillAccountService.getById(req.getAccountId());
//        if (waybillAccount == null) return AjaxResult.error("电子面单账户不存在");
//
//        cn.qihangerp.sdk.dou.request.DouWaybillAccount waybillAccount1 = new cn.qihangerp.sdk.dou.request.DouWaybillAccount();
//        BeanUtils.copyProperties(waybillAccount, waybillAccount1);
//
//        // 按店铺分组（循环店铺处理）
//        Map<Long, List<OOrderStocking>> groupedByShop = oOrderStockings.stream().collect(Collectors.groupingBy(OOrderStocking::getShopId));
//        // 遍历每个shopId的分组 ,分别进行批量取号
//        for (Map.Entry<Long, List<OOrderStocking>> entry : groupedByShop.entrySet()) {
//            Long shopId = entry.getKey();
//            var shop = shopService.selectShopById(shopId);
//            if (shop == null) {
//                // 找不到店铺
//                log.info("========dou电子面单取号，找不到店铺数据========");
//                fail++;
//                continue;
//            }
//
//            // 组合批量取号参数
//            List<OrderInfosItem> orderInfosList = new ArrayList<>();
//
//            // 组合订单发货接口参数
//            List<DouLogisticsAdd> douLogisticsAddList = new ArrayList<>();
//
//            // 在每个shopId分组中进行循环处理
//            List<OOrderStocking> ordersForShop = entry.getValue();
//
//            for (OOrderStocking order : ordersForShop) {
//                if (order.getOrderStatus() != 1) {
//                    isSend++;//订单已发货
//                    continue;
//                } else if (order.getWaybillStatus() != 0) {
//                    isSend++;//订单已取号
//                    continue;
//                }
//                // 开始组装订单
//                OrderInfosItem orderInfosItem = new OrderInfosItem();
//                orderInfosItem.setOrderId(order.getOrderNum());
//                // 从店铺订单中拿订单收货地址信息
//                DouOrder douOrder = douOrderService.queryDetailByOrderId(order.getOrderNum());
//                if (douOrder == null) {
//                    log.info("========dou电子面单取号，找不到原始订单数据========");
//                    fail++;
//                    continue;
//                } else if (douOrder.getMainStatus().intValue() != 2 && douOrder.getMainStatus() != 101) {
//                    isSend++;//订单状态不允许再发货 2 备货中101 部分发货
//                    continue;
//                }
//                ReceiverInfo receiverInfo = new ReceiverInfo();
//                Address_4_4 address44 = new Address_4_4();
//                address44.setCountryCode("CHN");
//                address44.setProvinceName(douOrder.getProvinceName());
//                address44.setCityName(douOrder.getCityName());
//                address44.setDistrictName(douOrder.getTownName());
//                address44.setDetailAddress(douOrder.getMaskPostAddress());
//                receiverInfo.setAddress(address44);
//                Contact contact44 = new Contact();
//                contact44.setName(douOrder.getMaskPostReceiver());
//                contact44.setMobile("-");
//                receiverInfo.setContact(contact44);
//                orderInfosItem.setReceiverInfo(receiverInfo);
//
//                // 发货接口参数
//                DouLogisticsAdd logisticsAdd = new DouLogisticsAdd();
//                logisticsAdd.setOrderId(order.getOrderNum());
//                logisticsAdd.setSupplierShipOrderId(order.getId());
//                logisticsAdd.setShopId(order.getShopId());
//                logisticsAdd.setOOrderId(order.getOOrderId());
//                logisticsAdd.setDouOrderItemCount(douOrder.getItems().size());
//                // 发货接口参数
//                List<DouLogisticsProduct> productList = new ArrayList<>();
//
//                // 子订单信息（取号参数）
//                List<ItemsItem> itemList = new ArrayList<>();
//
//                // 查出供应商发货订单子订单信息
//                List<OOrderStockingItem> items = supplierShipOrderService.getItemsByOrderId(order.getId());
//                if (items != null && items.size() > 0) {
//                    for (var it : items) {
//                        // 从店铺订单中拿订单明细信息
//                        List<DouOrderItem> collect = douOrder.getItems().stream().filter(x -> x.getOrderId().equals(it.getSubOrderNum())).collect(Collectors.toList());
//                        DouOrderItem douOrderItem = collect.get(0);
//                        if (douOrderItem != null && douOrderItem.getRefundStatus().intValue() == 0 && douOrderItem.getMainStatus().intValue() == 2) {
//                            // 电子面单发货参数
//                            DouLogisticsProduct product = new DouLogisticsProduct();
//                            product.setProductOrderId(douOrderItem.getOrderId());
//                            product.setNum(douOrderItem.getItemNum().longValue());
//                            product.setOOrderItemId(it.getOOrderItemId());
//                            product.setSupplierOrderItemId(it.getId());
//                            productList.add(product);
//                            // 取号参数
//                            ItemsItem item = new ItemsItem();
//                            item.setItemCount(douOrderItem.getItemNum().intValue());
//                            item.setItemName(douOrderItem.getProductName());
//                            item.setItemSpecs(douOrderItem.getSpec());
//                            itemList.add(item);
//                        }
//                    }
//                }
//                logisticsAdd.setProductList(productList);
//                douLogisticsAddList.add(logisticsAdd);
//                // 取号参数
//                orderInfosItem.setItems(itemList);
//                if (waybillAccount.getCompany().toLowerCase().equals("jd")) {
//                    orderInfosItem.setProductType("LL-HD-M");
//                    orderInfosItem.setRemark("托寄物：预制菜");
//                }
//
//                orderInfosList.add(orderInfosItem);
//            }
//            // 组装数据结束，开始取单
//            ApiResultVo<EbillInfosItem> apiResultVo = DouWaybillApiHelper.getWaybillCode(appKey, appSecret, shop.getSellerId(), waybillAccount1, orderInfosList);
//
//            if (apiResultVo.getCode() != 0) {
//                fail += orderInfosList.size();
//                continue;
//            }
//            // 保存数据
//            for (var result : apiResultVo.getList()) {
//
//                List<OOrderStocking> collect = ordersForShop.stream().filter(x -> x.getOrderNum().equals(result.getOrderId())).collect(Collectors.toList());
//                if (!collect.isEmpty()) {
//                    OOrderStocking supplierShipOrder = collect.get(0);
//                    supplierShipOrder.setWaybillCode(result.getTrackNo());
//                    supplierShipOrder.setWaybillCompany(result.getCompany());
//                    // 额外打印信息（众邮、京东、丰网使用）
//                    supplierShipOrder.setPrintData(result.getExtraResp());
//                    supplierShipOrder.setWaybillOrderId(result.getOrderId());
//                    ResultVo<Long> resultVo = erpShipWaybillService.vendorWaybillCodeAndSend(supplierShipOrder, waybillAccount.getTemplateUrl(), 3);
//                    if (resultVo.getCode() == 0) {
//                        // 推送发货接口
//                        List<DouLogisticsAdd> douLogisticsAddList1 = douLogisticsAddList.stream().filter(x -> x.getOrderId().equals(result.getOrderId())).collect(Collectors.toList());
//                        if (douLogisticsAddList1 != null && douLogisticsAddList1.size() > 0) {
//                            // 抖店发货逻辑：如果是同一个订单多个包裹，那么需要调用一单多包发货接口
//                            // 如果还有子订单未发货，那么也需要调用一单多包发货接口
//                            // 否则就是整单发货
//                            if (douLogisticsAddList1.get(0).getProductList().size() == douLogisticsAddList1.get(0).getDouOrderItemCount()) {
//                                // 整单发货
//                                LogisticsAdd logisticsAdd = new LogisticsAdd();
//                                logisticsAdd.setOrderId(douLogisticsAddList1.get(0).getOrderId());
//                                logisticsAdd.setCompanyCode(result.getCompany());
//                                logisticsAdd.setLogisticsCode(result.getTrackNo());
//                                ApiResultVo<JSONObject> sendResult = DouLogisticsShipApiHelper.logisticsAdd(platform.getAppKey(), platform.getAppSecret(), shop.getSellerId(), logisticsAdd);
//                                log.info("==========Dou发货结果（整单发货）==========" + JSONObject.toJSONString(sendResult));
//                                if (sendResult.getCode() == 0) {
//                                    success++;
//                                } else {
//                                    fail++;
//                                }
//                            } else {
//                                OrderLogisticsAddMultiPackParam param = new OrderLogisticsAddMultiPackParam();
//                                param.setOrderId(douLogisticsAddList1.get(0).getOrderId());
//                                param.setRequestId(UUID.randomUUID().toString());
//                                List<PackListItem> packList = new ArrayList<>();
//                                PackListItem pack = new PackListItem();
//                                pack.setLogisticsCode(result.getTrackNo());
//                                pack.setCompanyCode(result.getCompany());
//                                List<ShippedOrderInfoItem> shippedOrderInfo = new ArrayList<>();
//                                for (var pc : douLogisticsAddList1.get(0).getProductList()) {
//                                    ShippedOrderInfoItem oi = new ShippedOrderInfoItem();
//                                    oi.setShippedNum(pc.getNum());
//                                    oi.setShippedOrderId(pc.getProductOrderId());
//                                    shippedOrderInfo.add(oi);
//
//                                }
//                                pack.setShippedOrderInfo(shippedOrderInfo);
//                                packList.add(pack);
//                                param.setPackList(packList);
//                                ApiResultVo<JSONObject> sendResult = DouLogisticsShipApiHelper.logisticsAddMultiPack(platform.getAppKey(), platform.getAppSecret(), shop.getSellerId(), param);
//                                log.info("==========Dou发货结果（一单多包）==========" + JSONObject.toJSONString(sendResult));
//                                if (sendResult.getCode() == 0) {
//                                    success++;
//                                } else {
//                                    fail++;
//                                }
//                            }
//                        }
//
//                    } else fail++;
//                }
//            }
//
//        }
//
//        String result = "发货结果：总计：" + total + " 成功：" + success + " 失败：" + fail + " 已发货：" + isSend;
//        log.info(result);
//        vo.setFail(fail);
//        vo.setSuccess(success);
//        vo.setIsSend(isSend);
//        return AjaxResult.success(vo);
//    }
//
//    @PostMapping("/get_print_data")
//    @ResponseBody
//    public AjaxResult getPrintData(@RequestBody DouWaybillGetBo req) {
////    if (req.getShopId() == null || req.getShopId() <= 0) {
////        return AjaxResult.error( "参数错误，没有店铺Id");
////    }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
////    var checkResult = apiCommon.checkBefore(req.getShopId());
////    if (checkResult.getCode() != 0) {
////        return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
////    }
////    String accessToken = checkResult.getData().getAccessToken();
////    String appKey = checkResult.getData().getAppKey();
////    String appSecret = checkResult.getData().getAppSecret();
////    Long sellerShopId = checkResult.getData().getSellerId();
////    ApiResultVo<Token> token = DouTokenApiHelper.getToken(appKey, appSecret,checkResult.getData().getSellerId());
////    if(token.getCode()==0) {
////        accessToken = token.getData().getAccessToken();
////    }else{
////        return AjaxResult.error(token.getMsg());
////    }
//        var platform = platformService.getById(EnumShopType.DOU.getIndex());
//        List<OOrderShipWaybill> list = erpShipWaybillService.getListBySupplierShipOrderIds(req.getIds());
//        // 按 shopId 字段进行分组
//        Map<Long, List<OOrderShipWaybill>> groupedByShopId = list.stream().collect(Collectors.groupingBy(OOrderShipWaybill::getShopId));
//        for (Map.Entry<Long, List<OOrderShipWaybill>> entry : groupedByShopId.entrySet()) {
//            Long shopId = entry.getKey();
//            var shop = shopService.selectShopById(shopId);
//            List<OOrderShipWaybill> waybills = entry.getValue();
//
//            List<WaybillAppliesItem> waybillApplyList = new ArrayList<>();
//            if (waybills != null && waybills.size() > 0) {
//                for (var ship : waybills) {
////                    if (!StringUtils.hasText(ship.getPrintData())) {
//                        WaybillAppliesItem dto = new WaybillAppliesItem();
//                        dto.setLogisticsCode(ship.getLogisticsCode());
//                        dto.setTrackNo(ship.getWaybillCode());
//                        waybillApplyList.add(dto);
////                    }
//                }
//            }
//            ApiResultVo<DouWaybillApplyResponse> apiResultVo = DouWaybillApiHelper.pullWaybillPrintData(platform.getAppKey(), platform.getAppSecret(), shop.getSellerId(), waybillApplyList);
//
//            if (apiResultVo.getCode() == 0) {
//                apiResultVo.getData().setTemplateUrl(list.get(0).getTemplateUrl());
//                return AjaxResult.success(apiResultVo.getData());
////                // 更新数据
////                for (var item : apiResultVo.getList()) {
////                    OShipWaybill waybillNew = new OShipWaybill();
////                    waybillNew.setPrintData(item.getPrintData());
////                    waybillNew.setSign(item.getSign());
////                    waybillNew.setUpdateBy("获取打印数据");
////                    waybillNew.setUpdateTime(new Date());
////                    erpShipWaybillService.update(waybillNew, new LambdaQueryWrapper<OShipWaybill>().eq(OShipWaybill::getWaybillCode, item.getTrackNo()));
////                    log.info("====保存電子面單打印信息jd========" + item.getOrderId());
////                    OShipWaybill list1 = list.stream().filter(x -> x.getWaybillCode().equals(item.getTrackNo())).findFirst().get();
////                    if (list1 != null) {
////                        list1.setPrintData(item.getPrintData());
////                    }
////                }
//            }else return AjaxResult.error(apiResultVo.getMsg());
//        }
//
//        return AjaxResult.success(list);
//    }
//
//
//    @PostMapping("/push_print_success")
//    @ResponseBody
//    public AjaxResult pushPrintSuccess(@RequestBody DouWaybillGetBo req) {
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
//        int total = req.getIds().length;
//        int success = 0;
//        int fail = 0;
//        for (String id : req.getIds()) {
//            ResultVo<Integer> resultVo = erpShipWaybillService.supplierPrintSuccess(id);
//            if (resultVo.getCode() == 0) success++;
//            else fail++;
//        }
//        String msg = "打印订单，总数：" + total + " 成功：" + success + " 失败：" + fail;
//        log.info(msg);
//        return AjaxResult.success(msg);
//    }
//
//    /**
//     * 发货
//     *
//     * @param req
//     * @return
//     */
//    @PostMapping("/push_ship_send")
//    @ResponseBody
//    public AjaxResult pushShipSend(@RequestBody DouWaybillGetBo req) {
////        if (req.getShopId() == null || req.getShopId() <= 0) {
////            return AjaxResult.error( "参数错误，没有店铺Id");
////        }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
////        erpShipWaybillService.pushShipSend(req.getShopId(), req.getIds());
//
//
//        int total  = req.getIds().length;
//        int success =0;
//        int fail = 0;
//        int exist =0 ;
//        for (String id:req.getIds()) {
//            ResultVo<Integer> resultVo = erpShipWaybillService.pushSupplierShipSend(id);
//            if (resultVo.getCode() == 0) success++;
//            else if(resultVo.getCode() == ResultVoEnum.Exist.getIndex()){
//                //存在
//                exist++;
//            }
//            else fail++;
//        }
//
//        String msg ="订单发货，总数："+total+ " 成功："+success+" 已经发货："+exist+" 失败："+fail;
//        log.info(msg);
//        return AjaxResult.success(msg);
//    }
//}
