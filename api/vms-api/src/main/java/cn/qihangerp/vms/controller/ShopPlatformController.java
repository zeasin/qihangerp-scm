//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.domain.OShopPlatform;
//import cn.qihangerp.module.service.OShopPlatformService;
//import cn.qihangerp.module.service.OShopService;
//import cn.qihangerp.security.common.BaseController;
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import lombok.AllArgsConstructor;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
///**
// * 店铺Controller
// *
// * @author qihang
// * @date 2023-12-31
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/shop")
//public class ShopPlatformController extends BaseController {
//    private final OShopService shopService;
//    private final OShopPlatformService shopPlatformService;
//
//    @GetMapping("/platformList")
//    public TableDataInfo platformList(OShopPlatform bo)
//    {
//        LambdaQueryWrapper<OShopPlatform> qw = new LambdaQueryWrapper<>();
//        qw.eq(StringUtils.hasText(bo.getStatus()),OShopPlatform::getStatus,bo.getStatus());
//        if(StringUtils.hasText(bo.getStatus())) {
//            qw.last(" ORDER BY sort asc");
//        }
//        List<OShopPlatform> list = shopPlatformService.list(qw);
//        return getDataTable(list);
//    }
//
//}
