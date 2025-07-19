package cn.qihangerp.vms.controller;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.module.stock.domain.ErpVendorStoredGoodsSku;
import cn.qihangerp.module.stock.service.ErpVendorStoredGoodsSkuService;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 商品管理Controller
 * 
 * @author qihang
 * @date 2023-12-29
 */
@AllArgsConstructor
@RestController
@RequestMapping("/stored_goods_sku")
public class StoredGoodsSkuController extends BaseController
{
    private final OGoodsService goodsService;

    private final ErpVendorStoredGoodsSkuService skuService;


    @GetMapping("/list")
    public TableDataInfo list(ErpVendorStoredGoodsSku goods, PageQuery pageQuery, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        goods.setVendorId(userId);
        PageResult<ErpVendorStoredGoodsSku> pageList = skuService.queryPageList(goods, pageQuery);
        return getDataTable(pageList);
    }




}
