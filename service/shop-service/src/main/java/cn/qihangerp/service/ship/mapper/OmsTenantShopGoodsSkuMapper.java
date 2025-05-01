package cn.qihangerp.service.ship.mapper;


import cn.qihangerp.model.shop.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.model.shop.vo.ShopGoodsSpecListVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods_sku】的数据库操作Mapper
* @createDate 2024-06-23 14:13:07
* @Entity cn.qihangerp.model.shop.domain.OmsTenantShopGoodsSku
*/
public interface OmsTenantShopGoodsSkuMapper extends BaseMapper<OmsTenantShopGoodsSku> {
    List<ShopGoodsSpecListVo> searchGoodsSpec(String keyword, Long shopId, Long tenantId);
}




