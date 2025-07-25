package cn.qihangerp.model.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.order.bo.ShopOrderQueryBo;
import cn.qihangerp.model.order.domain.ShopOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【oms_shop_order】的数据库操作Service
* @createDate 2025-07-20 14:58:38
*/
public interface ShopOrderService extends IService<ShopOrder> {
    PageResult<ShopOrder> queryOrderPageList(ShopOrderQueryBo bo, PageQuery pageQuery);
    PageResult<ShopOrder> queryWaitShipOrderPageList(ShopOrderQueryBo bo, PageQuery pageQuery);
    ShopOrder queryDetailById(Long orderId);
    /**
     * 保存店铺订单
     * @param shopId
     * @param order
     * @return
     */
    ResultVo<Integer> saveOrder(Long shopId, ShopOrder order);
}
