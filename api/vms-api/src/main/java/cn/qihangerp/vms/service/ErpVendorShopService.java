//package cn.qihangerp.vms.service;
//
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.domain.OShop;
//import cn.qihangerp.vms.domain.ErpVendorShop;
//import com.baomidou.mybatisplus.extension.service.IService;
//
//import java.util.List;
//
///**
//* @author qilip
//* @description 针对表【erp_vendor_shop(店铺表)】的数据库操作Service
//* @createDate 2025-06-19 17:53:21
//*/
//public interface ErpVendorShopService extends IService<ErpVendorShop> {
//    PageResult<ErpVendorShop> queryPageList(ErpVendorShop shop, PageQuery pageQuery);
//    List<ErpVendorShop> selectShopList(ErpVendorShop shop);
//    int updateShopById(ErpVendorShop shop);
//    int insertShop(ErpVendorShop shop);
//    int deleteShopByIds(Long[] ids);
//    void updateSessionKey(Long shopId, String token,String refreshToken);
//
//}
