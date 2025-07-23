package cn.qihangerp.model.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.bo.VendorShipOrderQuery;
import cn.qihangerp.model.order.domain.OmsOrderStocking;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author 1
* @description 针对表【oms_order_stocking(供应商发货订单)】的数据库操作Service
* @createDate 2025-07-23 08:50:40
*/
public interface OmsOrderStockingService extends IService<OmsOrderStocking> {
    PageResult<OmsOrderStocking> queryPageList(VendorShipOrderQuery bo, PageQuery pageQuery);
}
