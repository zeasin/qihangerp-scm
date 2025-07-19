//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.module.domain.ErpVendorWaybillAccount;
//import cn.qihangerp.module.service.ErpVendorWaybillAccountService;
//import cn.qihangerp.open.common.ApiResultVo;
//import cn.qihangerp.request.ApiPullRequest;
//import cn.qihangerp.request.PullRequest;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import cn.qihangerp.vms.OpenApiService;
//import cn.qihangerp.vms.domain.ErpVendorShop;
//import cn.qihangerp.vms.request.LogisticsTemplateRequest;
//import cn.qihangerp.vms.request.VendorWaybillAccountUpdateRequest;
//import cn.qihangerp.vms.response.PddWaybillList;
//import cn.qihangerp.vms.service.ErpVendorShopService;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@Slf4j
//@RequestMapping("/vendor/ewaybill")
//@RestController
//public class VendorWayBillAccountController extends BaseController {
//    @Value("${open.appKey}")
//    public String appKey;
//    @Autowired
//    private OpenApiService openApiService;
//    @Autowired
//    private  ErpVendorWaybillAccountService waybillAccountService;
//    @Autowired
//    private ErpVendorShopService vendorShopService;
//
//    /**
//     * 获取电子面单账户()
//     * @param
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/get_waybill_account_list", method = RequestMethod.GET)
//    public TableDataInfo getWaybillAccountList(ErpVendorWaybillAccount bo, PageQuery pageQuery, HttpServletRequest request) throws Exception {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        bo.setVendorId(userId);
//        PageResult<ErpVendorWaybillAccount> pageList = waybillAccountService.queryVendorPageList(bo, pageQuery);
//        return getDataTable(pageList);
//    }
//
//    /**
//     * 拉取电子面单账户
//     * @param params
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pull_waybill_account", method = RequestMethod.POST)
//    public AjaxResult pull_waybill_account(@RequestBody PullRequest params, HttpServletRequest request) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error( "参数错误，没有ShopId");
//        }
//        ErpVendorShop vendorShop = vendorShopService.getById(params.getShopId());
//        if(vendorShop==null) return AjaxResult.error("找不到店铺");
//        ApiPullRequest bo = new ApiPullRequest();
//        bo.setAppKey(vendorShop.getAppKey());
//        bo.setAppSecret(vendorShop.getAppSecret());
//        bo.setSellerId(vendorShop.getSellerId());
//        bo.setToken(vendorShop.getAccessToken());
//
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        if(vendorShop.getType().intValue()==100) {
//            // tao
//            ApiResultVo result = openApiService.pullTaoWaybillAccount(appKey, bo);
//            if(result.getCode()!=0) return AjaxResult.error(result.getMsg());
//
//            return AjaxResult.success(result);
//        }else if(vendorShop.getType().intValue()==200) {
//            // jd
//            ApiResultVo result = openApiService.pullJdWaybillAccount(appKey, bo);
//            if(result.getCode()!=0) return AjaxResult.error(result.getMsg());
//
//            return AjaxResult.success(result);
//        }else if(vendorShop.getType().intValue()==300) {
//            // pdd
//            ApiResultVo<PddWaybillList> apiResultVo = openApiService.pullPddWaybillAccount(appKey, bo);
//            if (apiResultVo.getCode() != 0) return AjaxResult.error(apiResultVo.getMsg());
//
//            List<ErpVendorWaybillAccount> list = new ArrayList<>();
//            for (var item : apiResultVo.getList()) {
//                if (item.getBranchAccountCols() != null && item.getBranchAccountCols().size() > 0) {
//                    for (var sendAddress : item.getBranchAccountCols()) {
//                        ErpVendorWaybillAccount vo = new ErpVendorWaybillAccount();
//                        vo.setVendorId(userId);
//                        vo.setType(0);
//                        vo.setMerchantId(0L);
//                        vo.setOriginAccountId(0L);
//                        vo.setShopId(params.getShopId());
//                        vo.setShopType(vendorShop.getType());
//                        vo.setSellerShopId(vendorShop.getSellerId());
//                        vo.setDeliveryId(item.getWpCode());
//                        vo.setCompanyType(item.getWpType());
//                        vo.setSiteCode(sendAddress.getBranchCode());
//                        vo.setSiteName(sendAddress.getBranchName());
//                        vo.setAcctId(0L);
//                        vo.setAcctType(0);
//                        vo.setStatus(1);
//                        vo.setAvailable(sendAddress.getQuantity().longValue());
//                        vo.setAllocated(sendAddress.getAllocatedQuantity().longValue());
//                        vo.setCancel(sendAddress.getCancelQuantity().longValue());
//                        vo.setRecycled(sendAddress.getRecycledQuantity().longValue());
//
//                        vo.setSenderProvince(sendAddress.getShippAddressCols().get(0).getProvince());
//                        vo.setSenderCounty(sendAddress.getShippAddressCols().get(0).getDistrict());
//                        vo.setSenderCity(sendAddress.getShippAddressCols().get(0).getCity());
////                        vo.setStreetName(sendAddress.getStreetName());
//                        vo.setSenderAddress(sendAddress.getShippAddressCols().get(0).getDetail());
//
//                        list.add(vo);
//                    }
//                }
//
//
//                log.info("========组装pdd电子面单账户信息==========");
//            }
//            waybillAccountService.syncAccountList(params.getShopId(),list);
//            return AjaxResult.success();
//        }else if(vendorShop.getType().intValue()==400) {
//            // dou
//            ApiResultVo result = openApiService.pullDouWaybillAccount(appKey, bo);
//            if(result.getCode()!=0) return AjaxResult.error(result.getMsg());
//
//            return AjaxResult.success(result);
//        }else if(vendorShop.getType().intValue()==500) {
//            // wei
//            ApiResultVo result = openApiService.pullWeiWaybillAccount(appKey, bo);
//            if(result.getCode()!=0) return AjaxResult.error(result.getMsg());
//
//            return AjaxResult.success(result);
//        }else{
//            return AjaxResult.error("暂不支持的平台");
//        }
//    }
//    /**
//     * 获取快递模版
//     * @param
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/get_waybill_template_list", method = RequestMethod.GET)
//    public AjaxResult getWaybillAccountList(LogisticsTemplateRequest bo, PageQuery pageQuery) throws Exception {
//        ApiPullRequest request = new ApiPullRequest();
//        request.setWpCode(bo.getWpCode());
//        ApiResultVo result = openApiService.getPddWaybillTemplateList(appKey, request);
////        List<PddLogisticsTemplate> pddLogisticsTemplates = logisticsTemplateService.queryListByWpCode(bo.getWpCode());
//
////        bo.setTenantId(getUserId());
////        PageResult<ShopWaybillTemplate> pageList = shopWaybillTemplateService.queryPageList(bo, pageQuery);
//        return AjaxResult.success(result.getData());
//    }
//    @RequestMapping(value = "/updateAccount", method = RequestMethod.POST)
//    public AjaxResult updateAccount(@RequestBody VendorWaybillAccountUpdateRequest params) throws Exception {
//        if (params.getId() == null || params.getId() <= 0) return AjaxResult.error("参数错误，没有Id");
//        if (!StringUtils.hasText(params.getName())) return AjaxResult.error("缺少参数");
//        if (!StringUtils.hasText(params.getMobile())) return AjaxResult.error("缺少参数");
//        if (!StringUtils.hasText(params.getSiteName())) return AjaxResult.error("缺少参数");
////        if (!StringUtils.hasText(params.getSiteCode())) return AjaxResult.error("缺少参数");
//        if (!StringUtils.hasText(params.getTemplateUrl())) return AjaxResult.error("缺少参数");
//
//        ErpVendorWaybillAccount account = new ErpVendorWaybillAccount();
//        account.setId(params.getId());
//        account.setSiteName(params.getSiteName());
////        account.setSiteCode(params.getSiteCode());
//        account.setName(params.getName());
//        account.setMobile(params.getMobile());
//        if(StringUtils.hasText(params.getSellerShopId())) {
//            account.setSellerShopId(Long.parseLong(params.getSellerShopId()));
//        }
//        account.setTemplateUrl(params.getTemplateUrl());
//        waybillAccountService.updateById(account);
//
//        return AjaxResult.success();
//    }
//
//}
