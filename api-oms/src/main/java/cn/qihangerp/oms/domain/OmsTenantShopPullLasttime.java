package cn.qihangerp.oms.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 租户店铺更新最后时间记录
 * @TableName oms_tenant_shop_pull_lasttime
 */
@Data
public class OmsTenantShopPullLasttime implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 类型（ORDER:订单，REFUND:退款）
     */
    private Object pullType;

    /**
     * 最后更新时间
     */
    private Date lasttime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}