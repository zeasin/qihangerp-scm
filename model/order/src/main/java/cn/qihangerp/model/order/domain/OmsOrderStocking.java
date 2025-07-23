package cn.qihangerp.model.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 供应商发货订单
 * @TableName oms_order_stocking
 */
@TableName(value ="oms_order_stocking")
@Data
public class OmsOrderStocking {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 关联订单id
     */
    private Long oOrderId;

    /**
     * 订单编号（第三方平台订单号）
     */
    private String orderNum;

    /**
     * 订单下单时间
     */
    private Date orderTime;

    /**
     * 店铺类型
     */
    private Long shopType;

    /**
     * 店铺ID
     */
    private Long shopId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 卖家留言信息
     */
    private String sellerMemo;

    /**
     * 发货状态1：待发货，2：已发货，3已推送
     */
    private Integer sendStatus;

    /**
     * 发货时间
     */
    private Date shippingTime;

    /**
     * 快递单号
     */
    private String shippingNumber;

    /**
     * 物流公司
     */
    private String shippingCompany;

    /**
     * 发货人
     */
    private String shippingMan;

    /**
     * 发货费用
     */
    private BigDecimal shippingCost;

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
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String town;

    /**
     * 平台取号
     */
    private String waybillCode;

    /**
     * 取号状态0未取号1已取号
     */
    private Integer waybillStatus;

    /**
     * 电子面单快递公司
     */
    private String waybillCompany;

    /**
     * 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
     */
    private Integer orderStatus;

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

    /**
     * 推送状态(0推送失败1推送成功)
     */
    private Integer erpPushStatus;

    /**
     * 推送返回结果
     */
    private String erpPushResult;

    /**
     * 推送参数1
     */
    private String erpPushParam1;

    /**
     * 推送参数2
     */
    private String erpPushParam2;

    /**
     * 推送参数3
     */
    private String erpPushParam3;

    /**
     * 发货仓库编码
     */
    private String warehouseNo;

    /**
     * 承运商编码
     */
    private String shipperNo;

    /**
     * 京东云仓店铺编码
     */
    private String shopNo;

    /**
     * 订单来源平台编码
     */
    private String platformNo;
    private List<OmsOrderStockingItem> itemList;
}