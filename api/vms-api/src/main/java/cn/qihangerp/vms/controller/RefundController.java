//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.module.order.domain.ORefundAfterSale;
//import cn.qihangerp.module.order.domain.bo.RefundProcessingBo;
//import cn.qihangerp.module.order.domain.bo.RefundSearchBo;
//import cn.qihangerp.module.order.service.ORefundAfterSaleService;
//import cn.qihangerp.module.order.service.OSupplierRefundService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
///**
// * 退换货Controller
// *
// * @author qihang
// * @date 2024-01-13
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/refund")
//public class RefundController extends BaseController
//{
//    private final OSupplierRefundService refundService;
//    private final ORefundAfterSaleService afterSaleService;
//    /**
//     * 处理记录列表
//     */
//    @GetMapping("/processRecordList")
//    public TableDataInfo ship_again_list(ORefundAfterSale bo, PageQuery pageQuery, HttpServletRequest request)
//    {
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setSupplierId(userId);
//        PageResult<ORefundAfterSale> result = afterSaleService.queryPageList(bo, pageQuery);
//        return getDataTable(result);
//    }
//
//    /**
//     * 查询退换货列表
//     */
//    @GetMapping("/list")
//    public TableDataInfo list(RefundSearchBo bo, PageQuery pageQuery, HttpServletRequest request)
//    {
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setSupplierId(userId);
//        var pageList = refundService.queryPageList(bo,pageQuery);
//        return getDataTable(pageList);
//    }
//
//
//    /**
//     * 获取退换货详细信息
//     */
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(refundService.getById(id));
//    }
//
//
//
//
//
//    @PostMapping("/processing")
//    public AjaxResult refundProcessing(@RequestBody RefundProcessingBo bo , HttpServletRequest request) {
//        if (bo.getRefundId() == null) return AjaxResult.error(500, "缺少参数refundId");
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        ResultVo<Long> resultVo = refundService.refundProcessing(bo, "",userId);
//        if(resultVo.getCode() == 0) return success();
//        else return AjaxResult.error(resultVo.getMsg());
//    }
//}
