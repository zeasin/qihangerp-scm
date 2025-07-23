package cn.qihangerp.model.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.bo.OrderQuery;
import cn.qihangerp.model.order.domain.OmsOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【scm_order(订单表)】的数据库操作Service
* @createDate 2024-06-23 09:36:46
*/
public interface OmsOrderService extends IService<OmsOrder> {
    PageResult<OmsOrder> queryPageList(OrderQuery bo, PageQuery pageQuery);
    OmsOrder queryDetailById(Long id);
    int insertOrder(OmsOrder order);
}
