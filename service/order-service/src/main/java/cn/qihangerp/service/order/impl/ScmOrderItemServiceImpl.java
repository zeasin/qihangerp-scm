package cn.qihangerp.service.order.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.order.domain.ScmOrderItem;
import cn.qihangerp.interfaces.order.service.ScmOrderItemService;
import cn.qihangerp.service.order.mapper.ScmOrderItemMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【scm_order_item(订单明细表)】的数据库操作Service实现
* @createDate 2024-06-23 09:36:46
*/
@DubboService
@Service
public class ScmOrderItemServiceImpl extends ServiceImpl<ScmOrderItemMapper, ScmOrderItem>
    implements ScmOrderItemService{

}




