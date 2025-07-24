package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.utils.StringUtils;
import cn.qihangerp.model.goods.domain.ErpGoodsSpec;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.service.goods.mapper.ErpGoodsSpecMapper;
import cn.qihangerp.service.goods.mapper.ShopGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.service.ShopGoodsService;
import cn.qihangerp.service.goods.mapper.ShopGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【oms_shop_goods(其他渠道店铺商品)】的数据库操作Service实现
* @createDate 2025-07-20 14:25:00
*/
@AllArgsConstructor
@Service
public class ShopGoodsServiceImpl extends ServiceImpl<ShopGoodsMapper, ShopGoods>
    implements ShopGoodsService{
    private final ShopGoodsSkuMapper shopGoodsSkuMapper;
    private final ErpGoodsSpecMapper erpGoodsSpecMapper;

    @Override
    public PageResult<ShopGoods> queryPageList(ShopGoods bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ShopGoods> queryWrapper = new LambdaQueryWrapper<ShopGoods>()
                .eq(ShopGoods::getDeliverMethod,0)
                .eq(bo.getShopId()!=null,ShopGoods::getShopId,bo.getShopId())
                .eq(bo.getShopType()!=null,ShopGoods::getShopType,bo.getShopType())
                .eq(bo.getMerchantId()!=null,ShopGoods::getMerchantId,bo.getMerchantId())
                ;

        Page<ShopGoods> goodsPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        if(goodsPage.getTotal()>0){
            for(ShopGoods goods : goodsPage.getRecords()){
                goods.setSkus(shopGoodsSkuMapper.selectList(new LambdaQueryWrapper<ShopGoodsSku>()
                        .eq(ShopGoodsSku::getShopGoodsId,goods.getId())));
            }
        }
        return PageResult.build(goodsPage);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo saveAndUpdateGoods(Long shopId, ShopGoods goods) {

        List<ShopGoods> goodsList = this.baseMapper.selectList(
                new LambdaQueryWrapper<ShopGoods>()
                        .eq(ShopGoods::getPlatformProductId, goods.getPlatformProductId())
                        .eq(ShopGoods::getShopId, shopId)
        );

        if (goodsList != null && goodsList.size() > 0) {
            // 存在，更新
            goods.setId(goodsList.get(0).getId());
            goods.setUpdateOn(new Date());
            this.baseMapper.updateById(goods);

        } else {
            // 不存在，新增
            goods.setCreateOn(new Date());
            this.baseMapper.insert(goods);
        }

        // 插入sku
        if(goods.getSkus()!=null) {
            for (var sku : goods.getSkus()) {
                List<ShopGoodsSku> shopGoodsSkus = shopGoodsSkuMapper.selectList(new LambdaQueryWrapper<ShopGoodsSku>()
                        .eq(ShopGoodsSku::getPlatformSkuId, sku.getPlatformSkuId())
                        .eq(ShopGoodsSku::getShopId, shopId)
                );

                sku.setShopGoodsId(goods.getId());
                sku.setProductTitle(goods.getTitle());
                sku.setShopId(goods.getShopId());
                sku.setOuterProductId(goods.getOuterProductId());
                // 根据OuterId查找ERP系统中的skuid
                if(StringUtils.isNotEmpty(sku.getSkuCode())) {
                    List<ErpGoodsSpec> erpGoodsSkus = erpGoodsSpecMapper.selectList(
                            new LambdaQueryWrapper<ErpGoodsSpec>()
                                    .eq(ErpGoodsSpec::getSpecNum, sku.getSkuCode()));

                    if(erpGoodsSkus!=null && !erpGoodsSkus.isEmpty()){
                        sku.setErpGoodsId(erpGoodsSkus.get(0).getGoodsId());
                        sku.setErpGoodsSkuId(erpGoodsSkus.get(0).getId());
                    }
                }
                if(shopGoodsSkus!=null && !shopGoodsSkus.isEmpty()){
                    // 更新
                    sku.setUpdateOn(new Date());
                    sku.setId(shopGoodsSkus.get(0).getId());
                    shopGoodsSkuMapper.updateById(sku);
                }else {
                    sku.setCreateOn(new Date());
                    shopGoodsSkuMapper.insert(sku);
                }
            }
        }
        if (goodsList != null && goodsList.size() > 0) {
            return ResultVo.updateSuccess();
        }else return ResultVo.success();
    }

}




