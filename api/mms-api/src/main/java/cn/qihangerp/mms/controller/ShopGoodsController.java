package cn.qihangerp.mms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.bo.LinkErpGoodsSkuBo;
import cn.qihangerp.model.goods.bo.ShopGoodsSkuBo;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.model.goods.service.ShopGoodsService;
import cn.qihangerp.model.goods.service.ShopGoodsSkuService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/shop/goods")
@RestController
@AllArgsConstructor
public class ShopGoodsController extends BaseController {
    private final ShopGoodsService goodsService;
    private final ShopGoodsSkuService skuService;


    /**
     * 店铺商品list
     * @param bo
     * @param pageQuery
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(ShopGoods bo, PageQuery pageQuery) {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = 0l;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0l;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        bo.setMerchantId(merchantId);

        PageResult<ShopGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    /**
     * 店铺商品sku list
     * @param bo
     * @param pageQuery
     * @return
     */
    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(ShopGoodsSkuBo bo, PageQuery pageQuery) {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = 0l;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0l;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        bo.setMerchantId(merchantId);

        PageResult<ShopGoodsSku> result = skuService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    /**
     * 获取店铺订单详细信息
     */
    @GetMapping(value = "/sku/{id}")
    public AjaxResult getSkuInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(skuService.getById(id));
    }


    @PostMapping(value = "/sku/linkErp")
    public AjaxResult linkErp(@RequestBody LinkErpGoodsSkuBo bo)
    {
        if(StringUtils.isBlank(bo.getId())){
            return AjaxResult.error(500,"缺少参数Id");
        }
        if(bo.getErpGoodsSkuId()==null){
            return AjaxResult.error(500,"缺少参数erpGoodsSkuId");
        }

        ResultVo resultVo = skuService.linkErpGoodsSku(bo);
        if(resultVo.getCode()==0)
            return success();
        else return AjaxResult.error(resultVo.getMsg());

    }

}
