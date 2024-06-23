package cn.qihangerp.oms.service;

import cn.qihangerp.oms.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.oms.domain.vo.GoodsSpecListVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods_sku】的数据库操作Service
* @createDate 2024-06-23 14:13:07
*/
public interface OmsTenantShopGoodsSkuService extends IService<OmsTenantShopGoodsSku> {
    List<GoodsSpecListVo> searchGoodsSpec(String keyword,Long shopId,Long tenantId);
}
