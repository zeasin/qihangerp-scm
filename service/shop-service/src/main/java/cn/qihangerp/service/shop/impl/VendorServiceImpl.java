package cn.qihangerp.service.shop.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.shop.domain.Vendor;
import cn.qihangerp.model.shop.service.VendorService;
import cn.qihangerp.service.shop.mapper.VendorMapper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author qilip
* @description 针对表【scm_vendor】的数据库操作Service实现
* @createDate 2025-07-20 08:04:48
*/
@Service
public class VendorServiceImpl extends ServiceImpl<VendorMapper, Vendor>
    implements VendorService{

    @Override
    public PageResult<Vendor> queryPageList(Vendor bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Vendor> queryWrapper = new LambdaQueryWrapper<Vendor>()
                .eq(StringUtils.hasText(bo.getName()),Vendor::getName,bo.getName())
                .eq(bo.getDisable()!=null,Vendor::getDisable,bo.getDisable())
                .likeLeft(StringUtils.hasText(bo.getLoginName()),Vendor::getLoginName,bo.getLoginName())
                ;

//        pageQuery.setOrderByColumn("user_id");
//        pageQuery.setIsAsc("desc");
        Page<Vendor> goodsPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(goodsPage);
    }

    @Override
    public Vendor getByLoginName(String loginName) {
        LambdaQueryWrapper<Vendor> eq = new LambdaQueryWrapper<Vendor>().eq(Vendor::getLoginName, loginName);
        List<Vendor> erpVendors = this.baseMapper.selectList(eq);
        if(erpVendors.isEmpty()) return null;
        else return erpVendors.get(0);
    }
}




