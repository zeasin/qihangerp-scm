package cn.qihangerp.vms.request;

import lombok.Data;

@Data
public class VendorWaybillAccountUpdateRequest {
    private Long id;//电子面单Id
    private String siteName;
    private String siteCode;
    private String sellerShopId;
    private String name;
    private String mobile;
    /**
     * 打印模版url
     */
    private String templateUrl;
}
