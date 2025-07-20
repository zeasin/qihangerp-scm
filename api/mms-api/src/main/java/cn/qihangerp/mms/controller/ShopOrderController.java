package cn.qihangerp.mms.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.common.enums.EnumShopType;

import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.domain.bo.ShopOrderPushBo;
import cn.qihangerp.model.order.bo.ShopOrderQueryBo;
import cn.qihangerp.model.order.domain.ShopOrder;
import cn.qihangerp.model.order.service.ShopOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/shop/order")
public class ShopOrderController extends BaseController {
    private final ShopOrderService orderService;
    private final MqUtils mqUtils;
    /**
     * 店铺订单list
     * @param bo
     * @param pageQuery
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(ShopOrderQueryBo bo, PageQuery pageQuery) {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = 0l;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0l;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        bo.setMerchantId(merchantId);
        PageResult<ShopOrder> result = orderService.queryOrderPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.queryDetailById(id));
    }

    /**
     * 手动推送到系统
     * @param bo
     * @return
     */
    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody ShopOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(Long shopOrderId: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.QT, MqType.ORDER_MESSAGE,shopOrderId.toString()));
            }
        }
        return success();
    }
}
