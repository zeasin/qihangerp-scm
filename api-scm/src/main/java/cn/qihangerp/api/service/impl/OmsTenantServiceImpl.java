package cn.qihangerp.api.service.impl;

import cn.qihangerp.api.domain.bo.TenantBo;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.api.domain.OmsTenant;
import cn.qihangerp.api.service.OmsTenantService;
import cn.qihangerp.api.mapper.OmsTenantMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author TW
* @description 针对表【oms_tenant(租户用户表)】的数据库操作Service实现
* @createDate 2024-06-24 14:04:25
*/
@AllArgsConstructor
@Service
public class OmsTenantServiceImpl extends ServiceImpl<OmsTenantMapper, OmsTenant>
    implements OmsTenantService{
    private final OmsTenantMapper mapper;
    @Override
    public PageResult<OmsTenant> queryPageList(TenantBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsTenant> queryWrapper = new LambdaQueryWrapper<OmsTenant>()
                .eq(StringUtils.hasText(bo.getUserName()),OmsTenant::getUserName,bo.getUserName())
                .eq(bo.getStatus()!=null,OmsTenant::getStatus,bo.getStatus())
                .likeLeft(StringUtils.hasText(bo.getNickName()),OmsTenant::getNickName,bo.getNickName())
                ;

//        pageQuery.setOrderByColumn("user_id");
//        pageQuery.setIsAsc("desc");
        Page<OmsTenant> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(goodsPage);
    }

    @Override
    public OmsTenant selectTenantByUserName(String userName) {
        List<OmsTenant> scmDistributors = mapper.selectList(new LambdaQueryWrapper<OmsTenant>().eq(OmsTenant::getUserName, userName));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }
}




