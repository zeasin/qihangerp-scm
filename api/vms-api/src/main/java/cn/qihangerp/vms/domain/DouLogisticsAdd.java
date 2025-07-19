package cn.qihangerp.vms.domain;

import lombok.Data;

import java.util.List;

/**
 * 抖店发货组装数据
 */
@Data
public class DouLogisticsAdd {
    private String orderId;
    private Long shopId;
    private String waybillCode;
    private String waybillCompany;
    private Long supplierShipOrderId;//供应商发货订单ID
    private Long oOrderId;
    private int douOrderItemCount;
    private List<DouLogisticsProduct> productList;
}
