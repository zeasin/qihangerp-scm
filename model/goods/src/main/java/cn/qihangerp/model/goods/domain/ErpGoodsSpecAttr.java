package cn.qihangerp.model.goods.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 
 * @TableName erp_goods_spec_attr
 */
@Data
public class ErpGoodsSpecAttr implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private Integer goodsId;

    /**
     * 
     */
    private String type;

    /**
     * 
     */
    private String k;

    /**
     * 
     */
    private Integer kid;

    /**
     * 
     */
    private Integer vid;

    /**
     * 
     */
    private String v;

    /**
     * 
     */
    private String img;

    private static final long serialVersionUID = 1L;
}