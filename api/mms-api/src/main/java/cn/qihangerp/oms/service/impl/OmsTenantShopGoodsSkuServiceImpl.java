package cn.qihangerp.oms.service.impl;

import cn.qihangerp.oms.domain.vo.GoodsSpecListVo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.oms.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.oms.service.OmsTenantShopGoodsSkuService;
import cn.qihangerp.oms.mapper.OmsTenantShopGoodsSkuMapper;
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
    implements OmsTenantShopGoodsSkuService{
    private final OmsTenantShopGoodsSkuMapper mapper;

    @Override
    public List<GoodsSpecListVo> searchGoodsSpec(String keyword,Long shopId,Long tenantId) {
        return mapper.searchGoodsSpec(keyword, shopId, tenantId);
    }
}




