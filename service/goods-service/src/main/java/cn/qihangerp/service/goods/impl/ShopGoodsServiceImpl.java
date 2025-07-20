package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.service.goods.mapper.ShopGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.service.ShopGoodsService;
import cn.qihangerp.service.goods.mapper.ShopGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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
                goods.setSkuList(shopGoodsSkuMapper.selectList(new LambdaQueryWrapper<ShopGoodsSku>()
                        .eq(ShopGoodsSku::getShopGoodsId,goods.getId())));
            }
        }
        return PageResult.build(goodsPage);
    }

}




