package cn.qihangerp.service.ship.impl;


import cn.qihangerp.model.shop.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.model.shop.service.OmsTenantShopGoodsSkuService;
import cn.qihangerp.model.shop.vo.ShopGoodsSpecListVo;
import cn.qihangerp.service.ship.mapper.OmsTenantShopGoodsSkuMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods_sku】的数据库操作Service实现
* @createDate 2024-06-23 14:13:07
*/
@AllArgsConstructor
@Service
public class OmsTenantShopGoodsSkuServiceImpl extends ServiceImpl<OmsTenantShopGoodsSkuMapper, OmsTenantShopGoodsSku>
    implements OmsTenantShopGoodsSkuService {
    private final OmsTenantShopGoodsSkuMapper mapper;

    @Override
    public List<ShopGoodsSpecListVo> searchGoodsSpec(String keyword, Long shopId, Long tenantId) {
        return mapper.searchGoodsSpec(keyword, shopId, tenantId);
    }
}




