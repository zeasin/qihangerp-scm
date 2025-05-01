package cn.qihangerp.api.domain.bo;

import lombok.Data;

@Data
public class TenantBo {
    private String userName;
    private String nickName;
    private Integer status;
}
