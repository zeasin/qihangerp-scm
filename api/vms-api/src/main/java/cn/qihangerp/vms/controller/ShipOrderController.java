//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.common.TableDataInfo;
//import cn.qihangerp.module.order.domain.OOrderStockingItem;
//import cn.qihangerp.module.order.domain.bo.SupplierShipOrderItemListBo;
//import cn.qihangerp.module.order.service.OOrderShipWaybillService;
//import cn.qihangerp.module.order.service.OOrderStockingItemService;
//import cn.qihangerp.module.order.service.OOrderStockingService;
//import cn.qihangerp.request.SupplierShipOrderSearchRequest;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import cn.qihangerp.utils.DateUtils;
//import cn.qihangerp.utils.poi.ExcelUtil;
//import com.alibaba.fastjson2.JSONArray;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
///**
// * 店铺订单Controller
// *
// * @author qihang
// * @date 2023-12-31
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/ship/order")
//public class ShipOrderController extends BaseController
//{
//    private final OOrderStockingService shipOrderService;
//    private final OOrderStockingItemService shipOrderItemService;
//    private final OOrderShipWaybillService shipWaybillService;
//
//    /**
//     * 查询订单列表
//     */
//    @GetMapping("/list")
//    public TableDataInfo list(SupplierShipOrderSearchRequest bo, PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userIdFromToken = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setSupplierId(userId);
//        var pageList = shipOrderService.queryPageList(bo,pageQuery);
//        return getDataTable(pageList);
//    }
//
//    /**
//     * 查询补单订单列表
//     * @param bo
//     * @param pageQuery
//     * @param request
//     * @return
//     */
//    @GetMapping("/budadanList")
//    public TableDataInfo budadanList(SupplierShipOrderSearchRequest bo, PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        var pageList = shipOrderService.queryBudadanPageList(userId,bo.getOrderNum(),bo.getPlatformId(),pageQuery);
//        return getDataTable(pageList);
//    }
//
//    @GetMapping("/item_list")
//    public TableDataInfo list(SupplierShipOrderItemListBo bo, PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userIdFromToken = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setSupplierId(userId);
//        var pageList = shipOrderItemService.queryVendorStockingPageList(bo,pageQuery);
//        return getDataTable(pageList);
//    }
//
//    /**
//     * 获取店铺订单详细信息
//     */
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(shipOrderService.queryDetailById(id));
//    }
//
//    @PostMapping(value = "/updateSendStatus")
//    public AjaxResult updateSendStatus(@RequestBody Long[] ids){
//        if (ids == null || ids.length <= 0) {
//            return AjaxResult.error( "参数错误，没有选择订单");
//        }
//        int total = ids.length;
//        int success = 0;
//        int fail = 0;
//        for (Long id : ids) {
//            if (id != null) {
//                ResultVo<Long> resultVo = shipWaybillService.updateSendStatus(id);
//            }
//        }
//        return AjaxResult.success();
//    }
//
////    /**
////     * 订单发货
////     * @param order
////     * @return
////     */
////    @Log(title = "店铺订单", businessType = BusinessType.UPDATE)
////    @PostMapping("/ship")
////    public AjaxResult ship(@RequestBody ErpOrder order)
////    {
////        order.setUpdateBy(getUsername());
////        int result = orderService.shipErpOrder(order);
////        if(result == -1) return new AjaxResult(501,"订单不存在！");
////        else if(result == -2) return new AjaxResult(502,"订单号已存在！");
////        return toAjax(result);
////    }
//    @PostMapping("/item_export")
//    public void export(HttpServletResponse response, SupplierShipOrderItemListBo bo,HttpServletRequest request)
//    {
////        Long userIdFromToken = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setSupplierId(userId);
//        var list = shipOrderItemService.queryAllList2(bo);
//        for(var it:list){
//
//            String skuName = "";
//            try {
//                JSONArray spec = JSONArray.parse(it.getSkuName());
//                for (int i = 0; i < spec.size(); i++) {
//                    String s = spec.getJSONObject(i).getString("attr_value");
//                    if (!org.springframework.util.StringUtils.hasText(s) || s.equals("null")) {
//                        s = spec.getJSONObject(i).getString("value");
//                    }
//                    skuName += s + " ";
//                }
//            }catch (Exception e){
//                skuName = it.getSkuName();
//            }
//            it.setSkuName(skuName);
//            if(it.getRefundStatus().intValue()==1){
//                it.setRefundStatusStr("无售后或售后关闭");
//            }else if(it.getRefundStatus().intValue()==2){
//                it.setRefundStatusStr("售后处理中");
//            }else if(it.getRefundStatus().intValue()==3){
//                it.setRefundStatusStr("退款中");
//            }else if(it.getRefundStatus().intValue()==4){
//                it.setRefundStatusStr("退款成功");
//            }
//            if(it.getSendStatus()==1){
//                it.setSendStatusStr("待发货");
//            }else if(it.getSendStatus()==2){
//                it.setSendStatusStr("已发货");
//            }
//            it.setOrderTimeStr(DateUtils.parseDateToStr("yyyy-MM-dd HH:mm:ss",it.getOrderTime()));
//        }
//        ExcelUtil<OOrderStockingItem> util = new ExcelUtil<OOrderStockingItem>(OOrderStockingItem.class);
//        util.exportExcel(response, list, "订单明细");
//    }
//}
