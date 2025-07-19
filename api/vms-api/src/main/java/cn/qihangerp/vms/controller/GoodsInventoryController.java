package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.goods.domain.vo.GoodsSkuInventoryVo;
import cn.qihangerp.module.goods.service.OGoodsInventoryBatchService;
import cn.qihangerp.module.goods.service.OGoodsInventoryService;
import cn.qihangerp.module.stock.domain.ErpVendorInventory;
import cn.qihangerp.module.stock.domain.ErpVendorInventoryBatch;
import cn.qihangerp.module.stock.service.ErpVendorInventoryBatchService;
import cn.qihangerp.module.stock.service.ErpVendorInventoryService;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/goodsInventory")
public class GoodsInventoryController extends BaseController {
//    private final OGoodsInventoryService goodsInventoryService;
    private final ErpVendorInventoryService inventoryService;
    private final ErpVendorInventoryBatchService inventoryBatchService;


    @GetMapping("/list")
    public TableDataInfo list(ErpVendorInventory bo, PageQuery pageQuery, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        bo.setVendorId(userId);
        PageResult<ErpVendorInventory> pageResult = inventoryService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        ErpVendorInventory goodsInventory = inventoryService.getById(id);
        if(goodsInventory!=null) {
            List<ErpVendorInventoryBatch> list = inventoryBatchService.list(new LambdaQueryWrapper<ErpVendorInventoryBatch>()
                    .eq(ErpVendorInventoryBatch::getSkuId, goodsInventory.getSkuId()));
            return AjaxResult.success(list);
        }
        return success();
    }

    /**
     * 搜索SKU库存
     * @param keyword
     * @return
     */
    @GetMapping("/searchSkuInventoryBatch")
    public TableDataInfo searchSkuInventoryBatch(String keyword)
    {
        List<GoodsSkuInventoryVo> list = inventoryBatchService.searchSkuInventoryBatch(keyword);
        return getDataTable(list);
    }
}
