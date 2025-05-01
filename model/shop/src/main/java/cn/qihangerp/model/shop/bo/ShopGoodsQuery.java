package cn.qihangerp.model.shop.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ShopGoodsQuery implements Serializable {
    private Long tenantId;
    private Long shopId;
    private String goodsNum;
    private Integer status;
}
