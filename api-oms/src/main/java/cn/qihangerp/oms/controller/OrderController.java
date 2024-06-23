package cn.qihangerp.oms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.interfaces.order.bo.OrderQuery;
import cn.qihangerp.interfaces.order.domain.ScmOrder;
import cn.qihangerp.interfaces.order.service.ScmOrderService;
import cn.qihangerp.oms.security.SecurityUtils;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.*;

/**
 * 店铺订单Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController
{
    @DubboReference
    private ScmOrderService orderService;

    /**
     * 查询店铺订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(OrderQuery query, PageQuery pageQuery)
    {
        query.setTenantId(SecurityUtils.getUserId());
        PageResult<ScmOrder> pageResult = orderService.queryPageList(query,pageQuery);
        return getDataTable(pageResult);
    }


    /**
     * 获取店铺订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.getById(id));
    }

    /**
     * 新增店铺订单
     */
    @PostMapping
    public AjaxResult add(@RequestBody ScmOrder order)
    {
        order.setTenantId(SecurityUtils.getUserId());
        if(order.getGoodsAmount()==null)return new AjaxResult(1503,"请填写商品价格！");
        order.setCreateBy(getUsername());
        int result = orderService.insertOrder(order);
        if(result == -1) return new AjaxResult(501,"订单号已存在！");
        if(result == -2) return new AjaxResult(502,"请添加订单商品！");
        if(result == -3) return new AjaxResult(503,"请选择订单商品规格！");
        if(result == -4) return new AjaxResult(504,"请选择店铺！");
        if(result == -5) return new AjaxResult(505,"TenantId不能为空！");
        return toAjax(result);
    }

    /**
     * 订单发货(发货操作移到erpShipOrder中)
     * @param order
     * @return
     */
//    @Log(title = "店铺订单", businessType = BusinessType.UPDATE)
//    @PostMapping("/ship")
//    public AjaxResult ship(@RequestBody ErpOrder order)
//    {
//        order.setUpdateBy(getUsername());
//        int result = orderService.shipErpOrder(order);
//        if(result == -1) return new AjaxResult(501,"订单不存在！");
//        else if(result == -2) return new AjaxResult(502,"订单状态不对！无法发货！");
//        else if(result == -3) return new AjaxResult(502,"订单发货状态不对！无法发货！");
//        return toAjax(result);
//    }

}
