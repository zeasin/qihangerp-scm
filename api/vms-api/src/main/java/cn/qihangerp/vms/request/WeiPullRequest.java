package cn.qihangerp.vms.request;

import lombok.Data;

@Data
public class WeiPullRequest {
    private Long shopId;//店铺Id
    private Long orderId;//订单编号
}
