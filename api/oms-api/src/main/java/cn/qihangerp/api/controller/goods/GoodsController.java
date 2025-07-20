package cn.qihangerp.api.controller.goods;

import cn.qihangerp.common.*;
import cn.qihangerp.model.goods.domain.ErpGoods;
import cn.qihangerp.model.goods.service.ErpGoodsService;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@AllArgsConstructor
@RequestMapping("/goods/goods")
@RestController
public class GoodsController extends BaseController {

    private final ErpGoodsService goodsService;
    @GetMapping("/list")
    public TableDataInfo list(ErpGoods goods, PageQuery pageQuery)
    {
        PageResult<ErpGoods> pageResult = goodsService.queryPageList(goods, pageQuery);
        return getDataTable(pageResult);
    }

    /**
     * 删除
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(goodsService.removeBatchByIds(Arrays.stream(ids).toList()));
    }
}
