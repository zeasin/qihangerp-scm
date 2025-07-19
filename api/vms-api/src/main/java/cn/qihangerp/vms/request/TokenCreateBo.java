package cn.qihangerp.vms.request;

import lombok.Data;

@Data
public class TokenCreateBo {
    private String code;
    private Long shopId;
}
