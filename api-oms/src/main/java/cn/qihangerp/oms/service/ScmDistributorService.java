package cn.qihangerp.oms.service;

import cn.qihangerp.oms.domain.ScmDistributor;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【scm_distributor(分销用户信息表)】的数据库操作Service
* @createDate 2024-05-19 12:53:30
*/
public interface ScmDistributorService extends IService<ScmDistributor> {
    ScmDistributor selectUserByUserName(String userName);
    void updateByUserId(ScmDistributor entity,Long userId);
}
