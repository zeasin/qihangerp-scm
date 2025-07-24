package cn.qihangerp.model.goods.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 其他渠道店铺商品
 * @TableName oms_shop_goods
 */
@TableName(value ="oms_shop_goods")
@Data
public class ShopGoods {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 商户id
     */
    private Long merchantId;

    /**
     * 平台商品id
     */
    private String platformProductId;

    /**
     * 商家编码id
     */
    private String outerProductId;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 
     */
    private String subTitle;

    /**
     * 主图集合
     */
    private String imgs;

    /**
     * 第一张主图
     */
    private String img;

    /**
     * 商品详情字符串
     */
    private String descInfo;

    /**
     * 属性字符串
     */
    private String attrs;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 商品 SKU 最小价格（单位：分）
     */
    private Integer minPrice;

    /**
     * 市场价单位分
     */
    private Integer marketPrice;

    /**
     * 商品编码
     */
    private String spuCode;

    /**
     * 创建时间
     */
    private Integer addTime;

    /**
     * 修改时间
     */
    private Integer editTime;

    /**
     * 商品库商品id
     */
    private Long erpGoodsId;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 系统创建时间
     */
    private Date createOn;

    /**
     * 系统更新时间
     */
    private Date updateOn;

    /**
     * 商品发货方式，0：普通物流，1：虚拟发货，
     */
    private Integer deliverMethod;

    @TableField(exist = false)
    private List<ShopGoodsSku> skus;
}