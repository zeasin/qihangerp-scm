package cn.qihangerp.model.order.bo;

import lombok.Data;

import java.io.Serializable;

/**
 * 订单明细表
 * @TableName o_order_item
 */
@Data
public class SupplierShipOrderItemListBo implements Serializable {
    /**
     * id
     */

    private Integer sendStatus;
    private Integer refundStatus;
    private String orderNum;
    /**
     * 商品规格编码
     */
    private String skuCode;
    private Long supplierId;

    private static final long serialVersionUID = 1L;


}