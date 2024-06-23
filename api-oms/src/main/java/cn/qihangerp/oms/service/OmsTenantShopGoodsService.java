package cn.qihangerp.oms.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.oms.domain.OmsTenantShopGoods;
import cn.qihangerp.oms.domain.bo.ShopGoodsQuery;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_goods】的数据库操作Service
* @createDate 2024-06-23 14:13:07
*/
public interface OmsTenantShopGoodsService extends IService<OmsTenantShopGoods> {
    PageResult<OmsTenantShopGoods> queryPageList(ShopGoodsQuery bo, PageQuery pageQuery);
}
