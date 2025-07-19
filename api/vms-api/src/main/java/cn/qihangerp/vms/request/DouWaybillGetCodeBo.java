package cn.qihangerp.vms.request;

import lombok.Data;

@Data
public class DouWaybillGetCodeBo {
    private Long accountId;//电子面单账户id
    private Long[] ids;

}
