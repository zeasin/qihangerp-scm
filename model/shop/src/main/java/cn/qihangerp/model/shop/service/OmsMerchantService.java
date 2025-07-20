package cn.qihangerp.model.shop.service;

import cn.qihangerp.model.shop.bo.TenantBo;
import cn.qihangerp.model.shop.domain.OmsMerchant;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_tenant(租户用户表)】的数据库操作Service
* @createDate 2024-06-24 14:04:25
*/
public interface OmsMerchantService extends IService<OmsMerchant> {
    PageResult<OmsMerchant> queryPageList(TenantBo bo, PageQuery pageQuery);
    OmsMerchant selectTenantByUserName(String userName);
}
