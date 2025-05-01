package cn.qihangerp.interfaces.order.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 订单明细表
 * @TableName scm_order_item
 */
@Data
public class ScmOrderItem implements Serializable {
    /**
     * id，自增
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 平台SKUID
     */
    private Long platformSkuId;
    @TableField(exist = false)
    private Long skuId;

    /**
     * erp系统商品id
     */
    private Long erpGoodsId;

    /**
     * erp系统商品规格id
     */
    private Long erpGoodsSpecId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * SKU编码
     */
    private String skuCode;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否赠品0否1是
     */
    private Integer isGift;

    /**
     * 已退货数量
     */
    private Integer refundCount;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

    /**
     * 订单状态
     */
    private Integer orderStatus;

    /**
     * 租户ID（distributor）
     */
    private Long tenantId;

    private static final long serialVersionUID = 1L;
}