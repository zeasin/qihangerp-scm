package cn.qihangerp.vms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 店铺表
 * @TableName erp_vendor_shop
 */
@TableName(value ="erp_vendor_shop")
@Data
public class ErpVendorShop implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 供应商id
     */
    private Long vendorId;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 对应第三方平台Id
     */
    private Integer type;

    /**
     * 状态（1正常2已删除）
     */
    private Integer status;

    /**
     * 描述
     */
    private String remark;

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    private Long sellerId;

    /**
     * Appkey
     */
    private String appKey;

    /**
     * Appsercet
     */
    private String appSecret;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String accessToken;

    /**
     * 到期
     */
    private Long expiresIn;

    /**
     * access_token开始时间
     */
    private Long accessTokenBegin;

    /**
     * 刷新token
     */
    private String refreshToken;

    /**
     * 刷新token过期时间
     */
    private Long refreshTokenTimeout;

    /**
     * 请求url
     */
    private String apiRequestUrl;

    /**
     * 回掉URL
     */
    private String apiCallbackUrl;

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

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}