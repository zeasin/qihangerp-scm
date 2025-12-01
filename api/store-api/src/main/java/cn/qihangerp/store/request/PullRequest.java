package cn.qihangerp.store.request;

import lombok.Data;

@Data
public class PullRequest {
    private Long shopId;//店铺Id
    private Long orderId;//订单编号
}
