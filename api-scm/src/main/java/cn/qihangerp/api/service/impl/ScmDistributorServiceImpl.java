package cn.qihangerp.api.service.impl;

import cn.qihangerp.api.domain.bo.DistributorBo;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.api.domain.ScmDistributor;
import cn.qihangerp.api.service.ScmDistributorService;
import cn.qihangerp.api.mapper.ScmDistributorMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author qilip
* @description 针对表【scm_distributor(分销用户信息表)】的数据库操作Service实现
* @createDate 2024-06-22 14:43:17
*/
@AllArgsConstructor
@Service
public class ScmDistributorServiceImpl extends ServiceImpl<ScmDistributorMapper, ScmDistributor>
    implements ScmDistributorService{
    private final ScmDistributorMapper mapper;

    @Override
    public PageResult<ScmDistributor> queryPageList(DistributorBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ScmDistributor> queryWrapper = new LambdaQueryWrapper<ScmDistributor>()
                .eq(StringUtils.hasText(bo.getUserName()),ScmDistributor::getUserName,bo.getUserName())
                .eq(bo.getStatus()!=null,ScmDistributor::getStatus,bo.getStatus())
                .likeLeft(StringUtils.hasText(bo.getNickName()),ScmDistributor::getNickName,bo.getNickName())
                ;

        pageQuery.setOrderByColumn("user_id");
        pageQuery.setIsAsc("desc");
        Page<ScmDistributor> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(goodsPage);
    }

    @Override
    public ScmDistributor selectUserByUserName(String userName) {
        List<ScmDistributor> scmDistributors = mapper.selectList(new LambdaQueryWrapper<ScmDistributor>().eq(ScmDistributor::getUserName, userName));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }

    @Override
    public ScmDistributor selectUserByUserId(Long userId) {
        List<ScmDistributor> scmDistributors = mapper.selectList(new LambdaQueryWrapper<ScmDistributor>().eq(ScmDistributor::getUserId, userId));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }
}




