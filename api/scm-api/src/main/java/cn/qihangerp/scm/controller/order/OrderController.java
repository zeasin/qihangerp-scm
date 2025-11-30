package cn.qihangerp.scm.controller.order;

import cn.qihangerp.common.*;
import cn.qihangerp.model.order.bo.OrderQuery;
import cn.qihangerp.model.order.domain.OmsOrder;
import cn.qihangerp.model.order.service.OmsOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {

    private OmsOrderService orderService;
    @GetMapping("/list")
    public TableDataInfo list(OrderQuery bo, PageQuery pageQuery)
    {
        PageResult<OmsOrder> pageResult = orderService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }
    /**
     * 获取订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.queryDetailById(id));
    }

}
