package cn.qihangerp.api.controller.goods;

import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.goods.bo.GoodsAddBo;
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
     * 新增商品管理
     */
    @PostMapping("/add")
    public AjaxResult add(@RequestBody GoodsAddBo goods)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long vendorId = 0l;
        if(userIdentity == null||userIdentity==0){
            vendorId = 0l;
        }else if(userIdentity==10){
            vendorId = SecurityUtils.getDeptId();
        }else{
            vendorId = -1L;
        }
        goods.setSupplierId(vendorId);
        ResultVo<Long> resultVo = goodsService.insertGoods(getUsername(), goods);
        if(resultVo.getCode()!=0) return AjaxResult.error(resultVo.getMsg());
        else return AjaxResult.success(resultVo.getData());
//        goods.setCreateBy(getUsername());
//        int result = goodsService.insertGoods(goods);
//        if(result == -1) new AjaxResult(501,"商品编码已存在");
//        return toAjax(1);
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
