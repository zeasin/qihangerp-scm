package cn.qihangerp.model.goods.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 商品规格库存管理
 * @TableName erp_goods_spec
 */
@TableName(value ="erp_goods_spec")
@Data
public class ErpGoodsSpec {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long goodsId;

    /**
     * 规格名
     */
    private String specName;

    /**
     * 规格编码
     */
    private String specNum;

    /**
     * 颜色id
     */
    private Long colorId;

    /**
     * 颜色值
     */
    private String colorValue;

    /**
     * 颜色图片
     */
    private String colorImage;

    /**
     * 尺码id
     */
    private Long sizeId;

    /**
     * 尺码值
     */
    private String sizeValue;

    /**
     * 款式id
     */
    private Long styleId;

    /**
     * 款式值
     */
    private String styleValue;

    /**
     * 库存条形码
     */
    private String barCode;

    /**
     * 预计采购价
     */
    private BigDecimal purPrice;

    /**
     * 建议零售价
     */
    private BigDecimal retailPrice;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 最低库存（预警）
     */
    private Integer lowQty;

    /**
     * 最高库存（预警）
     */
    private Integer highQty;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 外部erp系统商品id
     */
    private String outerErpGoodsId;

    /**
     * 外部erp系统skuId(唯一)
     */
    private String outerErpSkuId;

    /**
     * 商品名
     */
    private String goodsName;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 发货类型10自营发货20供应商发货
     */
    private Integer shipType;

    /**
     * 商品体积
     */
    private String volume;

    /**
     * 衣长
     */
    private Double length;

    /**
     * 高度
     */
    private Double height;

    /**
     * 宽度
     */
    private Double width;

    /**
     * 重量
     */
    private Double weight;
}