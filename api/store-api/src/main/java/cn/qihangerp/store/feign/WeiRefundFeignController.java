//package cn.qihangerp.store.feign;
//
//import cn.qihangerp.common.AjaxResult;
//
//import cn.qihangerp.module.open.wei.domain.WeiRefund;
//import cn.qihangerp.module.open.wei.service.WeiRefundService;
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.List;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/wei/refund")
//public class WeiRefundFeignController {
//    private final WeiRefundService refundService;
//    @GetMapping(value = "/get_detail")
//    public AjaxResult getInfo(String afterSaleOrderId)
//    {
//        List<WeiRefund> refundList = refundService.list(new LambdaQueryWrapper<WeiRefund>().eq(WeiRefund::getAfterSaleOrderId,afterSaleOrderId));
//        if(refundList==null) return AjaxResult.error(404,"没有找到退款单");
//        else return AjaxResult.success(refundList.get(0));
//    }
//}
