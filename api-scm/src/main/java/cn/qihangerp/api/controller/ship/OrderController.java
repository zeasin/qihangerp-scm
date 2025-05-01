package cn.qihangerp.api.controller.ship;

import cn.qihangerp.common.*;
import cn.qihangerp.interfaces.order.bo.OrderQuery;
import cn.qihangerp.interfaces.order.domain.ScmOrder;
import cn.qihangerp.interfaces.order.service.ScmOrderService;
import cn.qihangerp.interfaces.ship.domain.ErpShipLogistics;
import cn.qihangerp.interfaces.ship.service.ErpShipLogisticsService;
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
