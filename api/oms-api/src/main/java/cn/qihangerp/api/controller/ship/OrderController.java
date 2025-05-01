package cn.qihangerp.api.controller.ship;

import cn.qihangerp.common.*;
import cn.qihangerp.model.order.bo.OrderQuery;
import cn.qihangerp.model.order.domain.ScmOrder;
import cn.qihangerp.model.order.service.ScmOrderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ship/order")
public class OrderController extends BaseController {

    private ScmOrderService orderService;
    @GetMapping("/list")
    public TableDataInfo list(OrderQuery bo, PageQuery pageQuery)
    {
        PageResult<ScmOrder> pageResult = orderService.queryPageList(bo, pageQuery);
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
