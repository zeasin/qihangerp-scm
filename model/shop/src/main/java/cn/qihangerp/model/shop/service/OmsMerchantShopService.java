package cn.qihangerp.model.shop.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop(租户店铺表)】的数据库操作Service
* @createDate 2024-06-23 11:10:08
*/
public interface OmsMerchantShopService extends IService<OmsMerchantShop> {
    PageResult<OmsMerchantShop> queryPageList(OmsMerchantShop bo, PageQuery pageQuery);
    List<OmsMerchantShop> selectShopList(OmsMerchantShop shop);
    void updateSessionKey(Long shopId,String token,String refreshToken);
}
