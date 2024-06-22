package cn.qihangerp.api.service;

import cn.qihangerp.api.domain.ScmDistributor;
import cn.qihangerp.api.domain.bo.DistributorBo;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【scm_distributor(分销用户信息表)】的数据库操作Service
* @createDate 2024-06-22 14:43:17
*/
public interface ScmDistributorService extends IService<ScmDistributor> {
    PageResult<ScmDistributor> queryPageList(DistributorBo bo, PageQuery pageQuery);
    ScmDistributor selectUserByUserName(String userName);
    ScmDistributor selectUserByUserId(Long userId);
}
