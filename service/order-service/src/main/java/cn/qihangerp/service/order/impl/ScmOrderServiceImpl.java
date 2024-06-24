package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.utils.DateUtils;
import cn.qihangerp.interfaces.order.bo.OrderQuery;
import cn.qihangerp.interfaces.order.domain.ScmOrderItem;
import cn.qihangerp.service.order.mapper.ScmOrderItemMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.order.domain.ScmOrder;
import cn.qihangerp.interfaces.order.service.ScmOrderService;
import cn.qihangerp.service.order.mapper.ScmOrderMapper;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【scm_order(订单表)】的数据库操作Service实现
* @createDate 2024-06-23 09:36:46
*/
@DubboService
@AllArgsConstructor
@Service
public class ScmOrderServiceImpl extends ServiceImpl<ScmOrderMapper, ScmOrder>
    implements ScmOrderService{
    private final ScmOrderMapper orderMapper;
    private final ScmOrderItemMapper orderItemMapper;
    @Override
    public PageResult<ScmOrder> queryPageList(OrderQuery bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ScmOrder> queryWrapper = new LambdaQueryWrapper<ScmOrder>()
                .eq(bo.getTenantId()!=null,ScmOrder::getTenantId,bo.getTenantId())
                .eq(bo.getShopId()!=null,ScmOrder::getShopId,bo.getShopId())
                .eq(bo.getStatus()!=null,ScmOrder::getOrderStatus,bo.getStatus())
                .eq(StringUtils.hasText(bo.getOrderNum()),ScmOrder::getOrderNum,bo.getOrderNum())
                ;
        Page<ScmOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<ScmOrderItem>().eq(ScmOrderItem::getOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }

    @Override
    public ScmOrder queryDetailById(Long id) {
        ScmOrder order = orderMapper.selectById(id);
        if(order==null) return null;
        else{
            order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<ScmOrderItem>().eq(ScmOrderItem::getOrderId, order.getId())));
            return order;
        }
    }

    @Transactional
    @Override
    public int insertOrder(ScmOrder order)
    {
        if(order.getShopId()==null)return -6;
        if(order.getShopType()==null) return -6;
        List<ScmOrder> orders = orderMapper.selectList(new LambdaQueryWrapper<ScmOrder>().eq(ScmOrder::getOrderNum, order.getOrderNum()));

        if (orders!=null&& orders.size()>0) return -1;// 订单号已存在
//        erpOrder.setCreateTime(DateUtils.getNowDate());
//        int rows = erpOrderMapper.insertErpOrder(erpOrder);
//        insertErpOrderItem(erpOrder);
//        return rows;
        if(order.getItemList() == null || order.getItemList().size() == 0) return -2;
        else{
            // 循环查找是否缺少skuId
            for (ScmOrderItem orderItem : order.getItemList())
            {
                if(orderItem.getPlatformSkuId()==null || orderItem.getPlatformSkuId()<=0) return -3;
                if(orderItem.getErpGoodsId()==null || orderItem.getErpGoodsId()<=0) return -11;
                if(orderItem.getErpGoodsSpecId()==null || orderItem.getErpGoodsSpecId()<=0) return -12;
            }
        }
        if(order.getTenantId()==null) return -5;
//        if(order.getShopType()==null) return -4;
//        Shop shop = shopService.getById(order.getShopId());
//        if(shop!=null){
//            order.setShopType(shop.getPlatform());
//        }else return -4;

//        if(erpOrder.getShopId() == 1) erpOrder.setShopType(99);
//        else if(erpOrder.getShopId() == 5) erpOrder.setShopType(5);
//        else if(erpOrder.getShopId() == 6) erpOrder.setShopType(4);
//        else if(erpOrder.getShopId() == 13) erpOrder.setShopType(13);
//        else if(erpOrder.getShopId() == 21) erpOrder.setShopType(7);
//        else if(erpOrder.getShopId() == 22) erpOrder.setShopType(6);
        order.setRefundStatus(1);//无售后
        order.setOrderStatus(1);//待发货
        order.setGoodsAmount(0.0);
        order.setDiscountAmount(0.0);
        order.setPostage(0.0);
        order.setAmount(0.0);
        order.setOrderTime(new Date());
        order.setCreateTime(new Date());
        order.setShipType(1);
        order.setShipStatus(0);
        order.setCreateTime(DateUtils.getNowDate());
        orderMapper.insert(order);
        for(var item:order.getItemList()){
            item.setOrderId(order.getId());
            item.setShopId(order.getShopId());
            item.setTenantId(order.getTenantId());
            orderItemMapper.insert(item);
        }
//        int rows = erpOrderMapper.insertErpOrder(order);
//        insertErpOrderItem(order);
//        insertSShopOrderItem(shopOrder);
        return 1;
    }
}




