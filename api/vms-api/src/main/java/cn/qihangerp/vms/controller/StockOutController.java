//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.module.stock.domain.ErpStockOut;
//import cn.qihangerp.module.stock.domain.ErpVendorStockOut;
//import cn.qihangerp.module.stock.request.StockOutCreateRequest;
//import cn.qihangerp.module.stock.request.StockOutItemRequest;
//import cn.qihangerp.module.stock.service.ErpStockOutService;
//import cn.qihangerp.module.stock.service.ErpVendorStockOutService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/stockOut")
//public class StockOutController extends BaseController {
//    private final ErpStockOutService stockOutService;
//    private final ErpVendorStockOutService vendorStockOutService;
//
//    @GetMapping("/list")
//    public TableDataInfo list(ErpVendorStockOut bo, PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setVendorId(userId);
//        var pageList = vendorStockOutService.queryPageList(bo,pageQuery);
//        return getDataTable(pageList);
//    }
//
//    @PostMapping("/create")
//    public AjaxResult createEntry(@RequestBody StockOutCreateRequest body, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        body.setMerchantId(userId);
//        ResultVo<Long> resultVo = vendorStockOutService.createEntry(userId, "", body);
//        if(resultVo.getCode()==0)
//            return AjaxResult.success();
//        else return AjaxResult.error(resultVo.getMsg());
//    }
//
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
////        WmsStockIn entry = stockInService.getDetailAndItemById(id);
//        ErpVendorStockOut entry = vendorStockOutService.getDetailAndItemById(id);
//        return success(entry);
//    }
//    @PostMapping("/out")
//    public AjaxResult in(@RequestBody StockOutItemRequest body, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        ResultVo<Long> resultVo = vendorStockOutService.stockOut(userId, "", body);
//        if(resultVo.getCode()==0)
//            return AjaxResult.success();
//        else return AjaxResult.error(resultVo.getMsg());
//    }
//}
