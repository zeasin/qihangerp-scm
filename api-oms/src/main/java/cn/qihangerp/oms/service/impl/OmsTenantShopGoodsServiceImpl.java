package cn.qihangerp.oms.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.oms.domain.OmsTenantShopGoodsSku;
import cn.qihangerp.oms.domain.bo.ShopGoodsQuery;
import cn.qihangerp.oms.mapper.OmsTenantShopGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.oms.domain.OmsTenantShopGoods;
import cn.qihangerp.oms.service.OmsTenantShopGoodsService;
import cn.qihangerp.oms.mapper.OmsTenantShopGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods】的数据库操作Service实现
* @createDate 2024-06-23 14:13:07
*/
@AllArgsConstructor
@Service
public class OmsTenantShopGoodsServiceImpl extends ServiceImpl<OmsTenantShopGoodsMapper, OmsTenantShopGoods>
    implements OmsTenantShopGoodsService{
    private OmsTenantShopGoodsMapper mapper;
    private OmsTenantShopGoodsSkuMapper skuMapper;

    @Override
    public PageResult<OmsTenantShopGoods> queryPageList(ShopGoodsQuery bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsTenantShopGoods> queryWrapper = new LambdaQueryWrapper<OmsTenantShopGoods>()
                .eq(bo.getTenantId()!=null,OmsTenantShopGoods::getTenantId,bo.getTenantId())
                .eq(bo.getShopId()!=null,OmsTenantShopGoods::getShopId,bo.getShopId())
                .eq(bo.getStatus()!=null,OmsTenantShopGoods::getStatus,bo.getStatus())
                .eq(StringUtils.hasText(bo.getGoodsNum()),OmsTenantShopGoods::getGoodsNum,bo.getGoodsNum())
                ;
        Page<OmsTenantShopGoods> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询sku
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setSkuList(skuMapper.selectList(new LambdaQueryWrapper<OmsTenantShopGoodsSku>().eq(OmsTenantShopGoodsSku::getPlatformGoodsId, order.getPlatformGoodsId())));
            }
        }

        return PageResult.build(pages);
    }
}




