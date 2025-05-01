//package cn.qihangerp.api.controller.goods;
//
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.BaseController;
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.TableDataInfo;
//import cn.qihangerp.interfaces.goods.domain.ErpGoodsCategoryAttribute;
//import cn.qihangerp.interfaces.goods.service.ErpGoodsCategoryAttributeService;
//import jakarta.servlet.http.HttpServletResponse;
//import lombok.AllArgsConstructor;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Arrays;
//import java.util.List;
//
///**
// * 商品分类属性Controller
// *
// * @author qihang
// * @date 2023-12-29
// */
//@RestController
//@RequestMapping("/goods/categoryAttribute")
//public class GoodsCategoryAttributeController extends BaseController
//{
////    @DubboReference
////    private ErpGoodsCategoryAttributeService erpGoodsCategoryAttributeService;
//
//    /**
//     * 查询商品分类属性列表
//     */
//    @GetMapping("/list")
//    public TableDataInfo list(ErpGoodsCategoryAttribute bo, PageQuery pageQuery)
//    {
//       var pageResult = erpGoodsCategoryAttributeService.queryPageList(bo,pageQuery);
//        return getDataTable(pageResult);
//    }
//
//
//
//    /**
//     * 获取商品分类属性详细信息
//     */
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(erpGoodsCategoryAttributeService.getById(id));
//    }
//
//    /**
//     * 新增商品分类属性
//     */
//    @PostMapping
//    public AjaxResult add(@RequestBody ErpGoodsCategoryAttribute bo)
//    {
//        return toAjax(erpGoodsCategoryAttributeService.save(bo));
//    }
//
//    /**
//     * 修改商品分类属性
//     */
//    @PutMapping
//    public AjaxResult edit(@RequestBody ErpGoodsCategoryAttribute erpGoodsCategoryAttribute)
//    {
//        return toAjax(erpGoodsCategoryAttributeService.updateById(erpGoodsCategoryAttribute));
//    }
//
//    /**
//     * 删除商品分类属性
//     */
//	@DeleteMapping("/{ids}")
//    public AjaxResult remove(@PathVariable Long[] ids)
//    {
//        return toAjax(erpGoodsCategoryAttributeService.removeBatchByIds(Arrays.stream(ids).toList()));
//    }
//}
