package cn.qihangerp.model.shop.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 租户店铺表
 * @TableName oms_tenant_shop
 */
@Data
public class OmsTenantShop implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 店铺别名
     */
    private String nickName;

    /**
     * 店铺主题
     */
    private String company;

    /**
     * 对应第三方平台Id
     */
    private Integer type;

    /**
     * 店铺url
     */
    private String url;

    /**
     * 是否删除0否1是
     */
    private Integer isDelete;


    /**
     * 描述
     */
    private String remark;

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    private Long sellerUserId;

    /**
     * 卖家userId
     */
    private String sellerUserIdStr;

    /**
     * Appkey
     */
    private String appkey;

    /**
     * Appsercet
     */
    private String appSercet;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String accessToken;

    /**
     * 到期
     */
    private Long accessExpiresIn;

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
     * 服务请求url
     */
    private String serverUrl;

    /**
     * 服务回调URL
     */
    private String callbackUrl;

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