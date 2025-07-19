package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.domain.OShop;
import cn.qihangerp.module.service.OShopService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.request.ApiPullRequest;
import cn.qihangerp.shop.ShopTokenBo;
import cn.qihangerp.vms.OpenApiService;
import cn.qihangerp.vms.domain.ErpVendorShop;
import cn.qihangerp.vms.request.TokenCreateBo;
import cn.qihangerp.vms.service.ErpVendorShopService;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.loadtime.Aj;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
@RequestMapping("/shop/oauth")
@RestController
public class ShopOAuthController {
    @Autowired
    private ErpVendorShopService shopService;
    @Value("${open.appKey}")
    public String appKey;
    @Autowired
    private OpenApiService openApiService;


    @GetMapping("/getOAuthUrl")
    public AjaxResult oauth(@RequestParam Integer shopId) {
        if(shopId==null) return AjaxResult.error("缺少参数：shopId");
        ErpVendorShop shop = shopService.getById(shopId);
        if(shop==null) return AjaxResult.error("店铺不存在");
        if(StringUtils.isEmpty(shop.getApiCallbackUrl())) return AjaxResult.error("请设置回调URL");
        if(shop.getType().intValue()==300) {
            String url = "https://mms.pinduoduo.com/open.html?response_type=code&client_id=" + shop.getAppKey() + "&redirect_uri=" + URLEncoder.encode(shop.getApiCallbackUrl());
            return AjaxResult.success("SUCCESS", url);
        }else{
            return AjaxResult.error("暂未支持的平台");
        }
    }

    @PostMapping("/getToken")
    public AjaxResult getToken(@RequestBody TokenCreateBo createBo) throws IOException, InterruptedException {
        log.info("/**********获取拼多多授权token*********/");
        if(createBo.getShopId()==null) return AjaxResult.error("缺少参数：shopId");
        if(StringUtils.isEmpty(createBo.getCode())) return AjaxResult.error("缺少参数：code");
        ErpVendorShop shop = shopService.getById(createBo.getShopId());
        if(shop==null) return AjaxResult.error("店铺不存在");
        if(StringUtils.isEmpty(shop.getAppKey())) return AjaxResult.error("店铺未设置AppKey");
        if(StringUtils.isEmpty(shop.getAppSecret())) return AjaxResult.error("店铺未设置AppSecret");

        ApiPullRequest bo = new ApiPullRequest();
        bo.setAppKey(shop.getAppKey());
        bo.setAppSecret(shop.getAppSecret());
        bo.setCode(createBo.getCode());

        if(shop.getType().intValue()==300) {
            // pdd
            ApiResultVo<LinkedHashMap<String,Object>> result = openApiService.getPddToken(appKey, bo);
            if(result.getCode()!=0) return AjaxResult.error(result.getMsg());
            // 更新token
            ErpVendorShop updateShop = new ErpVendorShop();
            updateShop.setId(shop.getId());
            updateShop.setAccessToken(result.getData().get("accessToken").toString());
            updateShop.setExpiresIn(Long.parseLong(result.getData().get("expiresIn").toString()));
            updateShop.setRefreshToken(result.getData().get("refreshToken").toString());
            shopService.updateById(updateShop);
            return AjaxResult.success();
        }else{
            return AjaxResult.error("暂未支持的平台");
        }
    }

//    /**
//     * 获取授权成功
//     * @param req
//     * @param model
//     * @return
//     */
//    @RequestMapping("/getTokenSuccess")
//    public String getTokeSuccess(HttpServletRequest req, @RequestParam Long mallId, Model model){
//        var shop = shopService.selectShopById(mallId);
//        model.addAttribute("shop",shop);
//        model.addAttribute("shopId",shop.getId());
//        return "get_token_success";
//    }



}
