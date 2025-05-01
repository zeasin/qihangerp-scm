package cn.qihangerp.api.controller.goods;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.model.goods.domain.ErpGoodsCategoryAttributeValue;
import cn.qihangerp.model.goods.service.ErpGoodsCategoryAttributeValueService;

import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 商品分类属性值Controller
 * 
 * @author qihang
 * @date 2023-12-29
 */
@RestController
@RequestMapping("/goods/categoryAttributeValue")
public class GoodsCategoryAttributeValueController extends BaseController
{

    private ErpGoodsCategoryAttributeValueService erpGoodsCategoryAttributeValueService;

    /**
     * 查询商品分类属性值列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ErpGoodsCategoryAttributeValue erpGoodsCategoryAttributeValue)
    {
        List<ErpGoodsCategoryAttributeValue> list = erpGoodsCategoryAttributeValueService.queryListByCategoryAttributeId(erpGoodsCategoryAttributeValue.getCategoryAttributeId());
        return getDataTable(list);
    }



    /**
     * 获取商品分类属性值详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(erpGoodsCategoryAttributeValueService.getById(id));
    }

    /**
     * 新增商品分类属性值
     */

    @PostMapping
    public AjaxResult add(@RequestBody ErpGoodsCategoryAttributeValue erpGoodsCategoryAttributeValue)
    {
        return toAjax(erpGoodsCategoryAttributeValueService.save(erpGoodsCategoryAttributeValue));
    }

    /**
     * 修改商品分类属性值
     */
    @PutMapping
    public AjaxResult edit(@RequestBody ErpGoodsCategoryAttributeValue erpGoodsCategoryAttributeValue)
    {
        return toAjax(erpGoodsCategoryAttributeValueService.updateById(erpGoodsCategoryAttributeValue));
    }

    /**
     * 删除商品分类属性值
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(erpGoodsCategoryAttributeValueService.removeBatchByIds(Arrays.stream(ids).toList()));
    }
}
