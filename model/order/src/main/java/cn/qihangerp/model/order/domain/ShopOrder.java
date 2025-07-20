package cn.qihangerp.model.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 
 * @TableName oms_shop_order
 */
@TableName(value ="oms_shop_order")
@Data
public class ShopOrder implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商户id
     */
    private Long merchantId;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 平台订单id
     */
    private String orderId;

    /**
     * 平台订单创建时间，秒级时间戳
     */
    private Long orderTime;

    /**
     * 平台订单更新时间，秒级时间戳
     */
    private Long updateTime;

    /**
     * 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
     */
    private Integer orderStatus;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功
     */
    private Integer refundStatus;

    /**
     * 商品总价，单位为分
     */
    private Integer goodsAmount;

    /**
     * 订单金额，单位为分，order_price=original_order_price-discounted_price-deduction_price-change_down_price
     */
    private Integer orderAmount;

    /**
     * 运费，单位为分
     */
    private Integer freight;

    /**
     * 支付金额，单位：分
     */
    private Integer paymentAmount;

    /**
     * 优惠金额，单位为分
     */
    private Integer discountAmount;

    /**
     * 商家优惠金额，单位：分
     */
    private Integer sellerDiscount;

    /**
     * 平台优惠金额，单位：分
     */
    private Integer platformDiscount;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 卖家留言信息
     */
    private String sellerMemo;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 省份
     */
    private String province;

    /**
     * 城市
     */
    private String city;

    /**
     * 区
     */
    private String county;

    /**
     * 街道
     */
    private String town;

    /**
     * 收件人地址，不拼接省市区。加密
     */
    private String address;

    /**
     * 收件人姓名。订单状态为待发货状态，且订单未在审核中的情况下返回密文数据；
     */
    private String receiverName;

    /**
     * 收件人电话。订单状态为待发货状态，且订单未在审核中的情况下返回密文数据；
     */
    private String receiverPhone;

    /**
     * 虚拟发货订单联系方式(deliver_method=1时返回)
     */
    private String virtualOrderTelNumber;

    /**
     * 发货完成时间，秒级时间戳
     */
    private Integer shipDoneTime;

    /**
     * 电子面单代发时的订单密文

     */
    private String ewaybillOrderCode;

    /**
     * 订单确认状态（0未确认1已确认）
     */
    private Integer confirmStatus;

    /**
     * 确认时间
     */
    private Date confirmTime;

    /**
     * erp发货状态0未发货1已发货
     */
    private Integer erpShipStatus;

    /**
     * ERP发货时间
     */
    private Date erpShipTime;

    /**
     * 系统创建时间
     */
    private Date createOn;

    /**
     * 系统更新时间
     */
    private Date updateOn;

    /**
     * 店铺会员id
     */
    private Long shopMemberId;

    /**
     * 平台用户id
     */
    private Long platformUserId;

    /**
     * 平台用户账号、手机号
     */
    private String platformAccount;

    /**
     * 平台订单状态
     */
    private String platformOrderStatus;

    /**
     * 平台订单状态文本
     */
    private String platformOrderStatusText;

    /**
     * 订单发货方式，0：普通物流，1：虚拟发货，
     */
    private Integer deliverMethod;

    @TableField(exist = false)
    private List<ShopOrderItem> items;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}