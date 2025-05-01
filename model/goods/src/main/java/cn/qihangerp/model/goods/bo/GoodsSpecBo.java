package cn.qihangerp.model.goods.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodsSpecBo implements Serializable {
    private String goodsId;
    private String specNum;
    private Integer status;
}
