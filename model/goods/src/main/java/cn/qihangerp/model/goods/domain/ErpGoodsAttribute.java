package cn.qihangerp.model.goods.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 商品属性表
 * @TableName erp_goods_attribute
 */
@Data
public class ErpGoodsAttribute implements Serializable {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long goodsId;

    /**
     * 属性id
     */
    private Integer attributeId;

    /**
     * 属性名
     */
    private String name;

    /**
     * 属性值
     */
    private String value;

    private static final long serialVersionUID = 1L;
}