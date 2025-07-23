package cn.qihangerp.model.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.bo.SupplierShipOrderItemListBo;
import cn.qihangerp.model.order.domain.OmsOrderStockingItem;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author 1
* @description 针对表【oms_order_stocking_item】的数据库操作Service
* @createDate 2025-07-23 08:50:40
*/
public interface OmsOrderStockingItemService extends IService<OmsOrderStockingItem> {
    /**
     * 查询供应商备货清单
     * @param bo
     * @param pageQuery
     * @return
     */
    PageResult<OmsOrderStockingItem> queryVendorStockingPageList(SupplierShipOrderItemListBo bo, PageQuery pageQuery);
}
