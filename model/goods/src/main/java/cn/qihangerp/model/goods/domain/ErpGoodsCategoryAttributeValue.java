package cn.qihangerp.model.goods.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 
 * @TableName erp_goods_category_attribute_value
 */
@Data
public class ErpGoodsCategoryAttributeValue implements Serializable {
    /**
     * 主键，属性值id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 属性id
     */
    private Integer categoryAttributeId;

    /**
     * 属性值文本
     */
    private String value;

    /**
     * 生成SKU的编码
     */
    private String skuCode;

    /**
     * 
     */
    private Integer ordernum;

    /**
     * 
     */
    private Integer isdelete;

    private static final long serialVersionUID = 1L;
}