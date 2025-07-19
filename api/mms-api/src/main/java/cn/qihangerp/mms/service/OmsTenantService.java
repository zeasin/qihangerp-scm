package cn.qihangerp.mms.service;

import cn.qihangerp.mms.domain.OmsTenant;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【oms_tenant(租户用户表)】的数据库操作Service
* @createDate 2024-06-23 11:10:08
*/
public interface OmsTenantService extends IService<OmsTenant> {
    OmsTenant selectUserByUserName(String userName);
    void updateByUserId(OmsTenant tenant,Long userId);
}
