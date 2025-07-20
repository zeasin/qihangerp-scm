//package cn.qihangerp.mms.controller;
//
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.TableDataInfo;
//import cn.qihangerp.module.domain.ShopRefund;
//import cn.qihangerp.module.service.ShopRefundService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import lombok.AllArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//@Slf4j
//@AllArgsConstructor
//@RestController
//@RequestMapping("/shop/refund")
//public class ShopRefundController extends BaseController {
//    private final ShopRefundService refundService;
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public TableDataInfo goodsList(ShopRefund bo, PageQuery pageQuery) {
//        Integer userIdentity = SecurityUtils.getUserIdentity();
//        Long merchantId = 0l;
//        if(userIdentity == null||userIdentity==0){
//            merchantId = 0l;
//        }else if(userIdentity==20){
//            merchantId = SecurityUtils.getDeptId();
//        }else{
//            merchantId = -1L;
//        }
//        bo.setMerchantId(merchantId);
//        PageResult<ShopRefund> result = refundService.queryPageList(bo, pageQuery);
//
//        return getDataTable(result);
//    }
//
//
//
//}
