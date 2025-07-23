package cn.qihangerp.service.order.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.bo.VendorShipOrderQuery;
import cn.qihangerp.model.order.domain.OmsOrderStockingItem;
import cn.qihangerp.model.order.service.OmsOrderStockingItemService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.OmsOrderStocking;
import cn.qihangerp.model.order.service.OmsOrderStockingService;
import cn.qihangerp.service.order.mapper.OmsOrderStockingMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author 1
* @description 针对表【oms_order_stocking(供应商发货订单)】的数据库操作Service实现
* @createDate 2025-07-23 08:50:40
*/
@AllArgsConstructor
@Service
public class OmsOrderStockingServiceImpl extends ServiceImpl<OmsOrderStockingMapper, OmsOrderStocking>
    implements OmsOrderStockingService{

    private final OmsOrderStockingItemService shipOrderItemService;

    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);


    @Override
    public PageResult<OmsOrderStocking> queryPageList(VendorShipOrderQuery bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }
//        if(bo.getOrderStatus()==null) bo.setOrderStatus(1);

        LambdaQueryWrapper<OmsOrderStocking> queryWrapper = new LambdaQueryWrapper<OmsOrderStocking>()
                .eq(bo.getSupplierId()!=null, OmsOrderStocking::getSupplierId,bo.getSupplierId())
                .eq(bo.getShopId()!=null, OmsOrderStocking::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderNum()), OmsOrderStocking::getOrderNum,bo.getOrderNum())
                .eq(bo.getSendStatus()!=null, OmsOrderStocking::getSendStatus,bo.getSendStatus())
                .eq(bo.getWaybillStatus()!=null, OmsOrderStocking::getWaybillStatus,bo.getWaybillStatus())
                .eq(bo.getPlatformId()!=null, OmsOrderStocking::getShopType,bo.getPlatformId())
                .ge(StringUtils.hasText(bo.getStartTime()), OmsOrderStocking::getOrderTime,bo.getStartTime())
                .le(StringUtils.hasText(bo.getEndTime()), OmsOrderStocking::getOrderTime,bo.getEndTime())
                .eq(bo.getOrderStatus()!=null, OmsOrderStocking::getOrderStatus,bo.getOrderStatus());

        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OmsOrderStocking> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (OmsOrderStocking order:pages.getRecords()) {
                order.setItemList(shipOrderItemService.list(new LambdaQueryWrapper<OmsOrderStockingItem>().eq(OmsOrderStockingItem::getShipOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }
}




