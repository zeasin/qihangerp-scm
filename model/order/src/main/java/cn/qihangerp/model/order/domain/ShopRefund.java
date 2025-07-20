package cn.qihangerp.model.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 视频号小店退款
 * @TableName oms_shop_refund
 */
@TableName(value ="oms_shop_refund")
@Data
public class ShopRefund implements Serializable {
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
     * 售后单号
     */
    private String afterId;

    /**
     * 售后类型。(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
     */
    private String type;

    /**
     * 状态（10001待审核 10002等待买家退货 10003等待平台审核 10004待买家处理 10005等待卖家处理 10006等待卖家发货 14000拒绝退款 10011退款关闭 10010退款完成 10020售后成功 10021售后失败 10090退款中 10091换货成功 10092换货失败 10093维修关闭 10094维修成功 ）
     */
    private String status;

    /**
     * 订单号，该字段可用于获取订单
     */
    private String orderId;

    /**
     * 订单金额
     */
    private Double orderAmount;

    /**
     * 商品spuid
     */
    private String productId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImage;

    /**
     * 商品skuid
     */
    private String skuId;

    /**
     * 售后数量
     */
    private Integer count;

    /**
     * 标明售后单退款直接原因, 枚举值参考 RefundReason
     */
    private Integer refundReason;

    /**
     * 退款金额（分）
     */
    private Integer refundAmount;

    /**
     * 快递单号
     */
    private String returnWaybillId;

    /**
     * 物流公司id
     */
    private String returnDeliveryId;

    /**
     * 物流公司名称
     */
    private String returnDeliveryName;

    /**
     * 售后单创建时间戳
     */
    private Integer createTime;

    /**
     * 售后单更新时间戳
     */
    private Integer updateTime;

    /**
     * 退款原因
     */
    private String reason;

    /**
     * 退款原因解释
     */
    private String reasonText;

    /**
     * 确认状态1已确认0未确认
     */
    private Integer confirmStatus;

    /**
     * 确认时间
     */
    private Date confirmTime;

    /**
     * 订单发货状态 0:未发货， 1:已发货（包含：已发货，已揽收）
     */
    private Integer orderShipStatus;

    /**
     * 0-未勾选 1-消费者选择的收货状态为未收到货 2-消费者选择的收货状态为已收到货
     */
    private Integer userShipStatus;

    /**
     * 1纠纷退款 0非纠纷退款
     */
    private Integer disputeRefundStatus;

    /**
     * 系统创建时间
     */
    private Date createOn;

    /**
     * 系统更新时间
     */
    private Date updateOn;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}