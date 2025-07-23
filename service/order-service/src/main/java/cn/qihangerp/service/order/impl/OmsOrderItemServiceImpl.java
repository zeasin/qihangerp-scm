package cn.qihangerp.service.order.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.order.domain.OmsOrderItem;
import cn.qihangerp.model.order.service.OmsOrderItemService;
import cn.qihangerp.service.order.mapper.OmsOrderItemMapper;

import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【scm_order_item(订单明细表)】的数据库操作Service实现
* @createDate 2024-06-23 09:36:46
*/

@Service
public class OmsOrderItemServiceImpl extends ServiceImpl<OmsOrderItemMapper, OmsOrderItem>
    implements OmsOrderItemService {

}




