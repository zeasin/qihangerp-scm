package cn.qihangerp.api.service;

import cn.qihangerp.api.domain.OmsTenant;
import cn.qihangerp.api.domain.bo.TenantBo;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_tenant(租户用户表)】的数据库操作Service
* @createDate 2024-06-24 14:04:25
*/
public interface OmsTenantService extends IService<OmsTenant> {
    PageResult<OmsTenant> queryPageList(TenantBo bo, PageQuery pageQuery);
    OmsTenant selectTenantByUserName(String userName);
}
