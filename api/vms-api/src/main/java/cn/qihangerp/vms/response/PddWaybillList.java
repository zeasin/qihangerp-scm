package cn.qihangerp.vms.response;

import lombok.Data;

import java.util.List;

@Data
public class PddWaybillList {
    private String wpCode;
    private Integer wpType;
    private List<BranchAccountCol> branchAccountCols;

    @Data
    public static class BranchAccountCol{
        private Integer allocatedQuantity;
        private String branchCode;
        private String branchName;
        private Integer cancelQuantity;
        private Integer quantity;
        private Integer recycledQuantity;
        private List<ShippAddress> shippAddressCols;
    }

    @Data
    public static class ShippAddress{
        private String country;
        private String province;
        private String city;
        private String district;
        private String detail;
    }
}
