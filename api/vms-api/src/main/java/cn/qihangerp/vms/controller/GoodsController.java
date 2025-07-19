//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.common.utils.SecurityUtils;
//import cn.qihangerp.module.goods.domain.OGoods;
//import cn.qihangerp.module.goods.domain.vo.GoodsSpecListVo;
//import cn.qihangerp.module.goods.service.OGoodsService;
//import cn.qihangerp.module.service.OGoodsSkuService;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//import jakarta.servlet.http.HttpServletRequest;
//
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * 商品管理Controller
// *
// * @author qihang
// * @date 2023-12-29
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/goods")
//public class GoodsController extends BaseController
//{
//    private final OGoodsService goodsService;
//    private final OGoodsSkuService skuService;
//
//    /**
//     * 查询商品管理列表
//     */
//    @GetMapping("/list")
//    public TableDataInfo list(OGoods goods,PageQuery pageQuery, HttpServletRequest request)
//    {
////        Long userIdFromToken = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        goods.setSupplierId(userId);
//        PageResult<OGoods> pageList = goodsService.queryPageList(goods, pageQuery);
//        return getDataTable(pageList);
//    }
//
//    /**
//     * 获取商品管理详细信息
//     */
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(goodsService.selectGoodsById(id));
//    }
//    /**
//     * 获取商品管理详细信息
//     */
//
//    @GetMapping(value = "/sku/{id}")
//    public AjaxResult getSkuInfo(@PathVariable("id") Long id)
//    {
//        return success(skuService.getById(id));
//    }
//
//
//    /**
//     * 搜索商品SKU
//     * 条件：商品编码、SKU、商品名称
//     */
//    @GetMapping("/searchSku")
//    public TableDataInfo searchSkuBy(String keyword, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
////        List<GoodsSpecListVo> list = goodsService.getVendorGoodsSpecByCode(userId,keyword);
//        List<GoodsSpecListVo> list = new ArrayList<>();
//        return getDataTable(list);
//    }
//}
