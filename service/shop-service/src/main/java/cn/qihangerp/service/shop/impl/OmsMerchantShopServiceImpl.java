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
        LambdaQueryWrapper<OmsMerchantShop> queryWrapper = new LambdaQueryWrapper<OmsMerchantShop>()
                .likeRight(StringUtils.hasText(bo.getName()), OmsMerchantShop::getName, bo.getName())
                .eq(bo.getMerchantId() != null, OmsMerchantShop::getMerchantId, bo.getMerchantId())
                .eq(bo.getStatus()!=null, OmsMerchantShop::getStatus, bo.getStatus())
                .eq(bo.getType()!=null, OmsMerchantShop::getType, bo.getType())
                .eq(bo.getApiStatus() != null, OmsMerchantShop::getApiStatus, bo.getApiStatus());

        Page<OmsMerchantShop> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<OmsMerchantShop> selectShopList(OmsMerchantShop shop) {
        LambdaQueryWrapper<OmsMerchantShop> qw = new LambdaQueryWrapper<OmsMerchantShop>()
                .eq(shop.getMerchantId() != null, OmsMerchantShop::getMerchantId, shop.getMerchantId())
                .eq(OmsMerchantShop::getStatus,1)
                .eq(shop.getType()!=null, OmsMerchantShop::getType,shop.getType())
                .eq(shop.getApiStatus()!=null, OmsMerchantShop::getApiStatus,shop.getApiStatus())
                ;
        return this.baseMapper.selectList(qw);
    }
}




