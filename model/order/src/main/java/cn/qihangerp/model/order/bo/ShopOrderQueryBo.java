package cn.qihangerp.model.order.bo;

import lombok.Data;

import java.io.Serializable;

/**
 * 
 * @TableName wei_order
 */

@Data
public class ShopOrderQueryBo implements Serializable {

    private Long shopId;
    private Integer shopType;
    private Long merchantId;
    /**
     * 订单号
     */
    private String orderId;

    /**
     * 状态
     */
    private Integer orderStatus;
    private Integer refundStatus;
    private String startTime;
    private String endTime;

    private static final long serialVersionUID = 1L;
}