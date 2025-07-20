package cn.qihangerp.service.shop.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import cn.qihangerp.service.shop.mapper.OmsMerchantShopMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop(租户店铺表)】的数据库操作Service实现
* @createDate 2024-06-23 11:10:08
*/
@Service
public class OmsMerchantShopServiceImpl extends ServiceImpl<OmsMerchantShopMapper, OmsMerchantShop>
    implements OmsMerchantShopService {

    @Override
    public PageResult<OmsMerchantShop> queryPageList(OmsMerchantShop bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OShop> queryWrapper = new LambdaQueryWrapper<OShop>()
                .likeRight(StringUtils.hasText(bo.getName()), OShop::getName, bo.getName())
                .eq(bo.getMerchantId() != null, OShop::getMerchantId, bo.getMerchantId())
                .eq(bo.getStatus()!=null, OShop::getStatus, bo.getStatus())
                .eq(bo.getType()!=null, OShop::getType, bo.getType())
                .eq(bo.getRegionId() != null, OShop::getRegionId, bo.getRegionId());

        Page<OShop> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<OmsMerchantShop> selectShopList(OmsMerchantShop shop) {
        LambdaQueryWrapper<OmsMerchantShop> qw = new LambdaQueryWrapper<OmsMerchantShop>()
                .eq(shop.getMerchantId() != null, OmsMerchantShop::getMerchantId, shop.getMerchantId())
                .eq(OmsMerchantShop::getStatus,1)
                .eq(shop.getType()!=null, OShop::getType,shop.getType())
                .eq(shop.getShopGroupId()!=null, OShop::getShopGroupId,shop.getShopGroupId())
                .eq(shop.getManageUserId()!=null&&shop.getManageUserId()!=1,OShop::getManageUserId,shop.getManageUserId())
                ;
        return mapper.selectList(qw);
    }
}




