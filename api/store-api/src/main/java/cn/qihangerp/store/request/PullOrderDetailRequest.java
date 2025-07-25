package cn.qihangerp.store.request;

import lombok.Data;

@Data
public class PullOrderDetailRequest {
    private Long shopId;
    private String[] orderIds;
}
