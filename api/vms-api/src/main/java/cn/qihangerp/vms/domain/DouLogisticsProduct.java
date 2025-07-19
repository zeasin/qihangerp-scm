package cn.qihangerp.vms.domain;

import lombok.Data;

/**
 * 抖店发货组装数据
 */
@Data
public class DouLogisticsProduct {
    private Long supplierOrderItemId;
    private Long oOrderItemId;
    private String productOrderId;//抖店自定订单ID
    private Long num;//发货数量

}
