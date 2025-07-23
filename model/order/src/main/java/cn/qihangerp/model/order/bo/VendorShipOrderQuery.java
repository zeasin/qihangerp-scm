package cn.qihangerp.model.order.bo;

import lombok.Data;

@Data
public class VendorShipOrderQuery {

    private String orderNum;
    private Integer sendStatus;
    private Integer orderStatus;
    private String startTime;
    private String endTime;
    private Long supplierId;
    private Integer platformId;
    private Integer waybillStatus;
    private Integer stockingStatus;//状态0待备货1备货中2备货完成
    private Long shopId;
    private Long merchantId;
}
