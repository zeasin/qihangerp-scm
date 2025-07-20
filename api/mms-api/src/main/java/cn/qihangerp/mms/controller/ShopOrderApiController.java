//package cn.qihangerp.mms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.enums.EnumShopType;
//import cn.qihangerp.domain.OShop;
//import cn.qihangerp.module.service.OShopService;
//import cn.qihangerp.module.service.ShopOrderService;
//import cn.qihangerp.request.PullRequest;
//import cn.qihangerp.security.common.BaseController;
//import lombok.AllArgsConstructor;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.Date;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/shop/order")
//public class ShopOrderApiController extends BaseController {
//    private final ShopOrderService orderService;
//    private final OShopService shopService;
//
//    /**
//     * 拉取订单
//     * @param params
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
//    public AjaxResult pullList(@RequestBody PullRequest params) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error( "参数错误，没有店铺Id");
//        }
//        OShop shop = shopService.getById(params.getShopId());
//        if (shop == null) return AjaxResult.error("店铺不存在");
//
//        Date currDateTime = new Date();
//        long beginTime = System.currentTimeMillis();
//        if(shop.getType()== EnumShopType.TANG_LANG.getIndex()) {
//            return AjaxResult.error("螳螂系统请到专用菜单拉取订单");
//        }
//        return AjaxResult.error("不支持");
//    }
//    /**
//     * 拉取订单详情
//     * @param params
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pull_detail", method = RequestMethod.POST)
//    public AjaxResult pullDetail(@RequestBody PullRequest params) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error("参数错误，没有店铺Id");
//        }
//        if (StringUtils.isEmpty(params.getOrderId())) {
//            return AjaxResult.error( "参数错误，没有订单编号");
//        }
//        OShop shop = shopService.getById(params.getShopId());
//        if (shop == null) return AjaxResult.error("店铺不存在");
//
//        Date currDateTime = new Date();
//        long beginTime = System.currentTimeMillis();
//        if(shop.getType()== EnumShopType.TANG_LANG.getIndex()) {
//            return AjaxResult.error("螳螂系统请到专用菜单拉取订单");
//        }
//        return AjaxResult.error("不支持");
//    }
//}
