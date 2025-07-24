package cn.qihangerp.model.shop.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import lombok.Data;

/**
 * 店铺更新日志表
 * @TableName oms_shop_pull_logs
 */
@TableName(value ="oms_shop_pull_logs")
@Data
public class OmsShopPullLogs {
    /**
     * 主键Id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 平台id
     */
    private Integer shopType;

    /**
     * 商户ID
     */
    private Long merchantId;

    /**
     * 类型（ORDER订单，GOODS商品，REFUND退款）
     */
    private Object pullType;

    /**
     * 拉取方式（主动拉取、定时任务）
     */
    private String pullWay;

    /**
     * 拉取参数
     */
    private String pullParams;

    /**
     * 拉取结果
     */
    private String pullResult;

    /**
     * 拉取时间
     */
    private Date pullTime;

    /**
     * 耗时（毫秒）
     */
    private Long duration;
}