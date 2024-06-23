package cn.qihangerp.oms.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 
 * @TableName oms_tenant_shop_goods_sku
 */
@Data
public class OmsTenantShopGoodsSku implements Serializable {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 平台商品skuid
     */
    private Long skuId;

    /**
     * 平台商品id
     */
    private Long platformGoodsId;

    /**
     * 供应链商品规格ID
     */
    private Long erpGoodsSpecId;

    /**
     * 供应链商品ID
     */
    private Long erpGoodsId;

    /**
     * sku编码
     */
    private String skuCode;

    /**
     * sku描述
     */
    private String goodsSpec;

    /**
     * sku数量
     */
    private Long skuQuantity;

    /**
     * sku编码
     */
    private String outerId;

    /**
     * spu编码
     */
    private String outerGoodsId;

    /**
     * 分销基准价。代销场景均使用该价格。无SKU商品查看saleInfo中的consignPrice
     */
    private BigDecimal consignPrice;

    /**
     * 建议零售价
     */
    private Double retailPrice;

    /**
     * 报价时该规格的单价，国际站注意要点：含有SKU属性的在线批发产品设定具体价格时使用此值，若设置阶梯价格则使用priceRange
     */
    private Double price;

    /**
     * 可销售数量
     */
    private Integer amountOnsale;

    /**
     * 状态1上架2下架
     */
    private Integer status;

    /**
     * 店铺id
     */
    private Long shopId;


    /**
     * 租户ID（distributor）
     */
    private Long tenantId;

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

    private static final long serialVersionUID = 1L;
}