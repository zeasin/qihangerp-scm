//package cn.qihangerp.model.shop.domain;
//
//import java.io.Serializable;
//import java.util.Date;
//import java.util.List;
//
//import com.baomidou.mybatisplus.annotation.IdType;
//import com.baomidou.mybatisplus.annotation.TableField;
//import com.baomidou.mybatisplus.annotation.TableId;
//import lombok.Data;
//
///**
// *
// * @TableName oms_tenant_shop_goods
// */
//@Data
//public class OmsTenantShopGoods implements Serializable {
//    /**
//     *
//     */
//    @TableId(value = "id", type = IdType.AUTO)
//    private Long id;
//
//    /**
//     * 店铺id
//     */
//    private Long shopId;
//
//
//    /**
//     * 平台商品id
//     */
//    private Long platformGoodsId;
//
//    /**
//     * 供应链商品ID
//     */
//    private Long erpGoodsId;
//
//    /**
//     * 商品货号，erp系统商品编码
//     */
//    private String goodsNum;
//
//    /**
//     * 参考价格，返回价格区间，可能为空
//     */
//    private String price;
//
//    /**
//     * 商品标题
//     */
//    private String title;
//
//    /**
//     * 主图
//     */
//    private String goodsImg;
//
//    /**
//     * 累计销量
//     */
//    private Integer totalSales;
//
//    /**
//     * 状态（1上架2下架）
//     */
//    private Integer status;
//
//    /**
//     * 备注
//     */
//    private String remark;
//
//    /**
//     * 租户ID（distributor）
//     */
//    private Long tenantId;
//
//    /**
//     * 创建时间
//     */
//    private Date createTime;
//
//    /**
//     * 创建人
//     */
//    private String createBy;
//
//    /**
//     * 更新时间
//     */
//    private Date updateTime;
//
//    /**
//     * 更新人
//     */
//    private String updateBy;
//
//    @TableField(exist = false)
//    private List<OmsTenantShopGoodsSku> skuList;
//
//    private static final long serialVersionUID = 1L;
//}