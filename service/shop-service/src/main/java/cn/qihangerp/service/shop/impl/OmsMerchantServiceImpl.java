package cn.qihangerp.service.shop.impl;

import cn.qihangerp.model.shop.bo.TenantBo;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.service.shop.mapper.OmsMerchantMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.shop.domain.OmsMerchant;
import cn.qihangerp.model.shop.service.OmsMerchantService;

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
public class OmsMerchantServiceImpl extends ServiceImpl<OmsMerchantMapper, OmsMerchant>
    implements OmsMerchantService {
    private final OmsMerchantMapper mapper;
    @Override
    public PageResult<OmsMerchant> queryPageList(TenantBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsMerchant> queryWrapper = new LambdaQueryWrapper<OmsMerchant>()
                .eq(StringUtils.hasText(bo.getUserName()), OmsMerchant::getUserName,bo.getUserName())
                .eq(bo.getStatus()!=null, OmsMerchant::getStatus,bo.getStatus())
                .likeLeft(StringUtils.hasText(bo.getNickName()), OmsMerchant::getNickName,bo.getNickName())
                ;

//        pageQuery.setOrderByColumn("user_id");
//        pageQuery.setIsAsc("desc");
        Page<OmsMerchant> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(goodsPage);
    }

    @Override
    public OmsMerchant selectTenantByUserName(String userName) {
        List<OmsMerchant> scmDistributors = mapper.selectList(new LambdaQueryWrapper<OmsMerchant>().eq(OmsMerchant::getUserName, userName));
        if(scmDistributors == null || scmDistributors.size()==0)
            return null;
        else
            return scmDistributors.get(0);
    }
}




