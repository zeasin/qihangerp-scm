package cn.qihangerp.interfaces.order.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderQuery implements Serializable {
    private Long tenantId;
    private Long shopId;
    private String orderNum;
    private Integer status;
}
