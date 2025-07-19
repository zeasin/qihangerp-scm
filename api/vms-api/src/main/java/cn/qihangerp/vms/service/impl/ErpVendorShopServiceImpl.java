package cn.qihangerp.vms.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.domain.OShop;
import cn.qihangerp.domain.OShopPullLasttime;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.vms.domain.ErpVendorShop;
import cn.qihangerp.vms.service.ErpVendorShopService;
import cn.qihangerp.vms.mapper.ErpVendorShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【erp_vendor_shop(店铺表)】的数据库操作Service实现
* @createDate 2025-06-19 17:53:21
*/
@AllArgsConstructor
@Service
public class ErpVendorShopServiceImpl extends ServiceImpl<ErpVendorShopMapper, ErpVendorShop>
    implements ErpVendorShopService{

    @Override
    public PageResult<ErpVendorShop> queryPageList(ErpVendorShop bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpVendorShop> queryWrapper = new LambdaQueryWrapper<ErpVendorShop>()
                .likeRight(StringUtils.hasText(bo.getName()), ErpVendorShop::getName, bo.getName())
                .eq( ErpVendorShop::getVendorId, bo.getVendorId())
                .eq(bo.getType()!=null, ErpVendorShop::getType, bo.getType());

        Page<ErpVendorShop> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<ErpVendorShop> selectShopList(ErpVendorShop shop) {
        LambdaQueryWrapper<ErpVendorShop> qw = new LambdaQueryWrapper<ErpVendorShop>()
                .eq( ErpVendorShop::getVendorId, shop.getVendorId())
                .eq(shop.getType()!=null, ErpVendorShop::getType,shop.getType())
                ;
        return this.baseMapper.selectList(qw);
    }

    @Override
    public int updateShopById(ErpVendorShop shop) {

        shop.setUpdateTime(new Date());
        shop.setUpdateBy("");
        return this.baseMapper.updateById(shop);
    }

    @Override
    public int insertShop(ErpVendorShop shop) {
        shop.setCreateTime(new Date());
        shop.setCreateBy("");
        return this.baseMapper.insert(shop);
    }

    @Override
    public int deleteShopByIds(Long[] ids) {
        return this.baseMapper.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public void updateSessionKey(Long shopId, String token, String refreshToken) {
        ErpVendorShop shop = new ErpVendorShop();
        shop.setId(shopId);
        shop.setAccessToken(token);
        shop.setRefreshToken(refreshToken);
        this.baseMapper.updateById(shop);
    }
}




