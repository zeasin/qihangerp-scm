package cn.qihangerp.vms.request;

import lombok.Data;

@Data
public class WeiWaybillGetCodeBo {
    private Long accountId;//电子面单账户id
    private Long[] ids;
    private Long shopId;//店铺Id
}
