package cn.qihangerp.model.ship.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName erp_ship_logistics
 */
@Data
public class ErpShipLogistics implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 快递公司
     */
    private String name;

    /**
     * 快递公司编码
     */
    private String number;
    private String remark;
    private Integer status;

    private static final long serialVersionUID = 1L;
}