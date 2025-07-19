package cn.qihangerp.mms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.mms.domain.OmsTenant;
import cn.qihangerp.mms.service.OmsTenantService;
import cn.qihangerp.mms.mapper.OmsTenantMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant(租户用户表)】的数据库操作Service实现
* @createDate 2024-06-23 11:10:08
*/
@AllArgsConstructor
@Service
public class OmsTenantServiceImpl extends ServiceImpl<OmsTenantMapper, OmsTenant>
    implements OmsTenantService{
    private final OmsTenantMapper mapper;

    @Override
    public OmsTenant selectUserByUserName(String userName) {
        List<OmsTenant> scmDistributors = mapper.selectList(new LambdaQueryWrapper<OmsTenant>().eq(OmsTenant::getUserName, userName).eq(OmsTenant::getDelFlag, "0"));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }

    @Override
    public void updateByUserId(OmsTenant tenant,Long userId) {
        tenant.setId(userId);
        mapper.updateById(tenant);
//        mapper.update(tenant,new LambdaQueryWrapper<OmsTenant>().eq(OmsTenant::getId,userId));
    }
}




