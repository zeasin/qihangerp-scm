package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.service.order.mapper.AfterSaleMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.AfterSale;
import cn.qihangerp.model.order.service.AfterSaleService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【scm_after_sale(售后表)】的数据库操作Service实现
* @createDate 2025-07-20 11:07:50
*/
@Service
public class AfterSaleServiceImpl extends ServiceImpl<AfterSaleMapper, AfterSale>
    implements AfterSaleService{

    @Override
    public PageResult<AfterSale> queryPageList(AfterSale bo, PageQuery pageQuery) {
        LambdaQueryWrapper<AfterSale> queryWrapper = new LambdaQueryWrapper<AfterSale>()
                .eq(bo.getTenantId()!=null,AfterSale::getTenantId,bo.getTenantId())
                .eq(bo.getShopId()!=null,AfterSale::getShopId,bo.getShopId())
                .eq(bo.getStatus()!=null,AfterSale::getStatus,bo.getStatus())
                .eq(StringUtils.hasText(bo.getOriginalOrderId()),AfterSale::getOriginalOrderId,bo.getOriginalOrderId())
                ;
        Page<AfterSale> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




