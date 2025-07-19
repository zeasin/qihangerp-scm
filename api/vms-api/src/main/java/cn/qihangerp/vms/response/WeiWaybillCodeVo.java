package cn.qihangerp.vms.response;

import lombok.Data;

@Data
public class WeiWaybillCodeVo {
    private int total;
    private int fail;
    private int isSend;
    private int success;
}
