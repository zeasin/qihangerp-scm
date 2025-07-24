package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.domain.bo.LinkErpGoodsSkuBo;
import cn.qihangerp.model.goods.bo.ShopGoodsSkuBo;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.service.goods.mapper.ShopGoodsMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.model.goods.service.ShopGoodsSkuService;
import cn.qihangerp.service.goods.mapper.ShopGoodsSkuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【oms_shop_goods_sku(其他渠道店铺商品SKU)】的数据库操作Service实现
* @createDate 2025-07-20 14:25:00
*/
@AllArgsConstructor
@Service
public class ShopGoodsSkuServiceImpl extends ServiceImpl<ShopGoodsSkuMapper, ShopGoodsSku>
    implements ShopGoodsSkuService{
    private final ShopGoodsMapper shopGoodsMapper;
//    private final OGoodsSkuMapper oGoodsSkuMapper;

    @Override
    public PageResult<ShopGoodsSku> queryPageList(ShopGoodsSkuBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ShopGoodsSku> queryWrapper = new LambdaQueryWrapper<ShopGoodsSku>()
                .eq(StringUtils.hasText(bo.getProductId()),ShopGoodsSku::getPlatformProductId,bo.getProductId())
                .eq(StringUtils.hasText(bo.getOuterProductId()),ShopGoodsSku::getOuterProductId,bo.getOuterProductId())
                .eq(StringUtils.hasText(bo.getOuterSkuId()),ShopGoodsSku::getOuterSkuId,bo.getOuterSkuId())
                .eq(StringUtils.hasText(bo.getSkuId()),ShopGoodsSku::getPlatformSkuId,bo.getSkuId())
                .eq(bo.getShopId()!=null,ShopGoodsSku::getShopId,bo.getShopId())
                .eq(bo.getShopType()!=null,ShopGoodsSku::getShopType,bo.getShopType())
                .eq(bo.getMerchantId()!=null,ShopGoodsSku::getMerchantId,bo.getMerchantId())
                .eq(bo.getHasLink()!=null&&bo.getHasLink()==0,ShopGoodsSku::getErpGoodsSkuId,0)
                .gt(bo.getHasLink()!=null&&bo.getHasLink()==1,ShopGoodsSku::getErpGoodsSkuId,0)
                ;

        Page<ShopGoodsSku> goodsPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(goodsPage);
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo linkErpGoodsSku(LinkErpGoodsSkuBo bo) {
        ShopGoodsSku shopGoodsSku = this.baseMapper.selectById(bo.getId());
        if(shopGoodsSku == null) {
            return ResultVo.error("店铺商品sku数据不存在");
        }
        ShopGoods shopGoods = shopGoodsMapper.selectById(shopGoodsSku.getShopGoodsId());
        if(shopGoods==null){
            return ResultVo.error("店铺商品数据不存在");
        }

        if(bo.getErpGoodsSkuId()==0){
            // 取消原来的关联
            ShopGoodsSku sku = new ShopGoodsSku();
            sku.setId(Long.parseLong(bo.getId()));
            sku.setErpGoodsId(0l);
            sku.setErpGoodsSkuId(0l);
            this.baseMapper.updateById(sku);

            ShopGoods goodsUp=new ShopGoods();
            goodsUp.setId(shopGoods.getId());
            goodsUp.setErpGoodsId(0L);
            shopGoodsMapper.updateById(goodsUp);
            return ResultVo.success();
        }

//        OGoodsSku oGoodsSku = oGoodsSkuMapper.selectById(bo.getErpGoodsSkuId());
//        if(oGoodsSku == null) return ResultVo.error("未找到系统商品sku");
//
//
//        ShopGoodsSku sku = new ShopGoodsSku();
//        sku.setId(Long.parseLong(bo.getId()));
//        sku.setErpGoodsId(Long.parseLong(oGoodsSku.getGoodsId()));
//        sku.setErpGoodsSkuId(Long.parseLong(oGoodsSku.getId()));
//        this.baseMapper.updateById(sku);
//
//        ShopGoods goodsUp=new ShopGoods();
//        goodsUp.setId(shopGoods.getId());
//        goodsUp.setErpGoodsId(Long.parseLong(oGoodsSku.getGoodsId()));
//        shopGoodsMapper.updateById(goodsUp);
        return ResultVo.success();
    }
}




