package cn.qihangerp.oms.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;

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

    @Transactional
    @Override
    public ResultVo<Integer> addShopGoods(OmsTenantShopGoods goods) {
        if(goods.getPlatformGoodsId()==null||goods.getPlatformGoodsId()==0) return ResultVo.error(ResultVoEnum.ParamsError,"平台商品ID不能为空");
        if(goods.getErpGoodsId()==null)goods.setErpGoodsId(0L);
        if(goods.getSkuList()==null||goods.getSkuList().size()==0) return ResultVo.error(ResultVoEnum.ParamsError,"请添加SKU");
        goods.setCreateTime(new Date());
        mapper.insert(goods);
        for(var sku :goods.getSkuList()){
            if(sku.getSkuId()== null || sku.getSkuId()==0) return ResultVo.error(ResultVoEnum.ParamsError,"请填写完整SKU信息");
            sku.setPlatformGoodsId(goods.getPlatformGoodsId());
            sku.setErpGoodsId(goods.getErpGoodsId());
            if(sku.getErpGoodsSpecId()==null) sku.setErpGoodsSpecId(0L);
            sku.setShopId(goods.getShopId());
            sku.setTenantId(goods.getTenantId());
            sku.setCreateTime(new Date());
            skuMapper.insert(sku);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> delShopGoods(Long[] ids,Long tenantId) {
        for(var id :ids) {
            OmsTenantShopGoods omsTenantShopGoods = mapper.selectById(id);
            if (omsTenantShopGoods != null && omsTenantShopGoods.getTenantId() == tenantId) {
                mapper.deleteById(id);
                skuMapper.delete(new LambdaQueryWrapper<OmsTenantShopGoodsSku>().eq(OmsTenantShopGoodsSku::getPlatformGoodsId, omsTenantShopGoods.getPlatformGoodsId()));
            }
        }
        return ResultVo.success();
    }
}




