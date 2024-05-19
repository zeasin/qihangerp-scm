package cn.qihangerp.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.oms.domain.ScmDistributor;
import cn.qihangerp.oms.service.ScmDistributorService;
import cn.qihangerp.oms.mapper.ScmDistributorMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【scm_distributor(分销用户信息表)】的数据库操作Service实现
* @createDate 2024-05-19 12:53:30
*/
@AllArgsConstructor
@Service
public class ScmDistributorServiceImpl extends ServiceImpl<ScmDistributorMapper, ScmDistributor>
    implements ScmDistributorService{
    private final ScmDistributorMapper mapper;

    @Override
    public ScmDistributor selectUserByUserName(String userName) {
        List<ScmDistributor> scmDistributors = mapper.selectList(new LambdaQueryWrapper<ScmDistributor>().eq(ScmDistributor::getUserName, userName).eq(ScmDistributor::getDelFlag, "0"));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }

    @Override
    public void updateByUserId(ScmDistributor entity) {
        mapper.update(entity,new LambdaQueryWrapper<ScmDistributor>().eq(ScmDistributor::getUserId,entity.getUserId()));
    }
}




