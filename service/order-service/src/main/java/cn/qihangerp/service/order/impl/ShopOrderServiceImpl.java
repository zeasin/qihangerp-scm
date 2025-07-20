package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.utils.DateUtils;
import cn.qihangerp.model.order.bo.ShopOrderQueryBo;
import cn.qihangerp.model.order.domain.ShopOrderItem;
import cn.qihangerp.service.order.mapper.ShopOrderItemMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.ShopOrder;
import cn.qihangerp.model.order.service.ShopOrderService;
import cn.qihangerp.service.order.mapper.ShopOrderMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author qilip
* @description 针对表【oms_shop_order】的数据库操作Service实现
* @createDate 2025-07-20 14:58:38
*/
@AllArgsConstructor
@Service
public class ShopOrderServiceImpl extends ServiceImpl<ShopOrderMapper, ShopOrder>
    implements ShopOrderService{
    private final ShopOrderItemMapper itemMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    /**
     * 发货订单
     * @param bo
     * @param pageQuery
     * @return
     */
    @Override
    public PageResult<ShopOrder> queryOrderPageList(ShopOrderQueryBo bo, PageQuery pageQuery) {
        Long startTime = null;
        Long endTime = null;

        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
//                bo.setStartTime(bo.getStartTime()+" 00:00:00");
                startTime = DateUtils.parseDate(bo.getStartTime()+" 00:00:00").getTime() /1000;
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
//                bo.setEndTime(bo.getEndTime()+" 23:59:59");
                endTime = DateUtils.parseDate(bo.getEndTime()+" 23:59:59").getTime() /1000;
            }
        }
        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");


        LambdaQueryWrapper<ShopOrder> queryWrapper = new LambdaQueryWrapper<ShopOrder>()
                .eq(bo.getOrderStatus()!=null, ShopOrder::getOrderStatus,bo.getOrderStatus())
                .eq(bo.getRefundStatus()!=null, ShopOrder::getRefundStatus,bo.getRefundStatus())
                .eq(bo.getShopId()!=null, ShopOrder::getShopId,bo.getShopId())
                .eq(bo.getShopType()!=null, ShopOrder::getShopType,bo.getShopType())
                .eq(bo.getMerchantId()!=null, ShopOrder::getMerchantId,bo.getMerchantId())
                .ge(startTime!=null, ShopOrder::getOrderTime,startTime)
                .le(endTime!=null, ShopOrder::getOrderTime,endTime)
                .eq(StringUtils.hasText(bo.getOrderId()), ShopOrder::getOrderId,bo.getOrderId())
                .eq(ShopOrder::getDeliverMethod,0)
                ;

        Page<ShopOrder> orderPage = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        if(orderPage.getRecords()!=null){
            for (var order:orderPage.getRecords()) {
                order.setItems(itemMapper.selectList(
                        new LambdaQueryWrapper<ShopOrderItem>()
                                .eq(ShopOrderItem::getShopOrderId,order.getId()))
                );
            }
        }
        return PageResult.build(orderPage);
    }
    @Override
    public ShopOrder queryDetailById(Long orderId) {
        ShopOrder shopOrder = this.baseMapper.selectById(orderId);
        if(shopOrder!=null){
            shopOrder.setItems(itemMapper.selectList(
                    new LambdaQueryWrapper<ShopOrderItem>()
                            .eq(ShopOrderItem::getShopOrderId,shopOrder.getId())));

        }
        return shopOrder;
    }
}




