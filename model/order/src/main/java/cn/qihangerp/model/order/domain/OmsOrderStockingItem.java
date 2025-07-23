package cn.qihangerp.model.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName oms_order_stocking_item
 */
@TableName(value ="oms_order_stocking_item")
@Data
public class OmsOrderStockingItem {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 供应商发货订单id
     */
    private Long shipOrderId;

    /**
     * 订单号
     */
    private String orderNum;

    /**
     * 子订单号
     */
    private String subOrderNum;

    /**
     * o_order_id
     */
    private Long oOrderId;

    /**
     * o_order_item_id
     */
    private Long oOrderItemId;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 第三方平台productId
     */
    private String productId;

    /**
     * 第三方平台skuId
     */
    private String skuId;

    /**
     * 商品id(o_goods外键)
     */
    private Long goodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long goodsSkuId;

    /**
     * 商品标题
     */
    private String goodsName;

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
    private String skuName;

    /**
     * 商品规格编码
     */
    private String skuCode;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 发货状态1：待发货，2：已发货，
     */
    private Integer sendStatus;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 平台取号
     */
    private String waybillCode;

    /**
     * 取号状态0未取号1已取号
     */
    private Integer waybillStatus;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

    /**
     * 订单日期
     */
    private Date orderTime;

    /**
     * 状态0待备货1备货中2备货完成
     */
    private Integer stockingStatus;

    /**
     * 商户ID
     */
    private Long merchantId;

    /**
     * 发货仓库类型(0自有仓库1外部云仓)
     */
    private Integer warehouseType;

    /**
     * 发货仓库ID(自有仓库或外部云仓id)
     */
    private Long warehouseId;

    /**
     * 发货仓库名
     */
    private String warehouseName;
}