package cn.qihangerp.api.controller.goods;

import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.model.goods.domain.ErpGoodsCategory;
import cn.qihangerp.model.goods.service.ErpGoodsCategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/goods/category")
public class GoodsCategoryController extends BaseController {

    private ErpGoodsCategoryService categoryService;

    @GetMapping("/list")
    public TableDataInfo list(ErpGoodsCategory erpGoodsCategory)
    {
//        startPage();
        List<ErpGoodsCategory> list = categoryService.list();
        return getDataTable(list);
    }
}
