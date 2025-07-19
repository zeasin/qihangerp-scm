//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.TableDataInfo;
//import cn.qihangerp.domain.OShop;
//import cn.qihangerp.module.service.OShopService;
//import cn.qihangerp.module.domain.ErpVendorMerchant;
//import cn.qihangerp.module.service.ErpVendorMerchantService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/merchant")
//public class MerchantController extends BaseController {
//    private final OShopService oShopService;
//    private final ErpVendorMerchantService vendorMerchantService;
//
//    @GetMapping("/list")
//    public TableDataInfo list(ErpVendorMerchant bo, PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setVendorId(userId);
//        PageResult<ErpVendorMerchant> pageResult = vendorMerchantService.queryPageList(bo, pageQuery);
//
//        return getDataTable(pageResult);
//    }
//
//    /**
//     * 我的商户所有店铺list
//     * @param
//     * @param
//     * @param request
//     * @return
//     */
//    @GetMapping("/shopList")
//    public AjaxResult shopList(HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        List<ErpVendorMerchant> allMerchantList = vendorMerchantService.list(new LambdaQueryWrapper<ErpVendorMerchant>().eq(ErpVendorMerchant::getVendorId, userId));
//
//
//        List<Long> merchantIdList = allMerchantList.stream().map(ErpVendorMerchant::getMerchantId).toList();
//
//        List<Long> modifiableList = new ArrayList<>(merchantIdList);  // 转换为可修改的集合
//        modifiableList.add(0l);  // 现在可以修改
//
//
//        List<OShop> allMerchantShopList = oShopService.list(new LambdaQueryWrapper<OShop>().in(OShop::getMerchantId, modifiableList));
//
//        return AjaxResult.success(allMerchantShopList);
//    }
//
//
//}
