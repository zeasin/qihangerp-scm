package cn.qihangerp.oms.domain.vo;


import lombok.Data;

import java.math.BigDecimal;
@Data
public class GoodsSpecListVo {

    private Long id;
    private Long platformGoodsId;
    private Long skuId;
    /** 商品名称 */
    private String title;
    /** 商品编号 */
    private String goodsNum;
    private String skuCode;
    private String goodsSpec;
    /** 商品图片地址 */
    private String skuImg;
    private String goodsImg;
}
