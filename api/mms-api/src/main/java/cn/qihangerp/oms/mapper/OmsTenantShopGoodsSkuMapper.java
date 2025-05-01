package cn.qihangerp.oms.mapper;

import cn.qihangerp.oms.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.oms.domain.vo.GoodsSpecListVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods_sku】的数据库操作Mapper
* @createDate 2024-06-23 14:13:07
* @Entity cn.qihangerp.model.shop.domain.OmsTenantShopGoodsSku
*/
public interface OmsTenantShopGoodsSkuMapper extends BaseMapper<OmsTenantShopGoodsSku> {
    List<GoodsSpecListVo> searchGoodsSpec(String keyword,Long shopId,Long tenantId);
}




