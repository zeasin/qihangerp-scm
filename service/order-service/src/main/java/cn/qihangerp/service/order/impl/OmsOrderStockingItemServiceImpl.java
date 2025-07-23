package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.bo.SupplierShipOrderItemListBo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.OmsOrderStockingItem;
import cn.qihangerp.model.order.service.OmsOrderStockingItemService;
import cn.qihangerp.service.order.mapper.OmsOrderStockingItemMapper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author 1
* @description 针对表【oms_order_stocking_item】的数据库操作Service实现
* @createDate 2025-07-23 08:50:40
*/
@Service
public class OmsOrderStockingItemServiceImpl extends ServiceImpl<OmsOrderStockingItemMapper, OmsOrderStockingItem>
    implements OmsOrderStockingItemService{

    @Override
    public PageResult<OmsOrderStockingItem> queryVendorStockingPageList(SupplierShipOrderItemListBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsOrderStockingItem> queryWrapper = new LambdaQueryWrapper<OmsOrderStockingItem>()
                .eq(OmsOrderStockingItem::getSupplierId,bo.getSupplierId())
                .eq(StringUtils.hasText(bo.getOrderNum()), OmsOrderStockingItem::getOrderNum,bo.getOrderNum())
                .eq(StringUtils.hasText(bo.getSkuCode()), OmsOrderStockingItem::getSkuCode,bo.getSkuCode())
                .eq(bo.getSendStatus()!=null, OmsOrderStockingItem::getSendStatus,bo.getSendStatus())
                .eq(bo.getRefundStatus()!=null, OmsOrderStockingItem::getRefundStatus,bo.getRefundStatus());

        pageQuery.setOrderByColumn("id");
        pageQuery.setIsAsc("desc");
        Page<OmsOrderStockingItem> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




