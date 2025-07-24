package cn.qihangerp.store.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.PddTokenApiHelper;
import cn.qihangerp.open.pdd.model.Token;
import cn.qihangerp.store.request.TokenCreateBo;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;

@AllArgsConstructor
@RequestMapping("/pdd")
@RestController
public class PddOAuthController {
    @Autowired
    private OmsMerchantShopService shopService;
//    private final OShopPlatformService platformService;
//    @Autowired
//    private IShopService shopService;
//    @Autowired
//    private ServerConfig serverConfig;
    private static Logger log = LoggerFactory.getLogger(PddOAuthController.class);

    @GetMapping("/getOauthUrl")
    public AjaxResult oauth(@RequestParam Integer shopId) {
        OmsMerchantShop shop = shopService.getById(shopId);
        if(shop==null) return AjaxResult.error("店铺不存在");
        else if(shop.getType()!=EnumShopType.PDD.getIndex()) return AjaxResult.error("非PDD店铺");
        if(StringUtils.isEmpty(shop.getCallbackUrl())) return AjaxResult.error("请设置回调URL");

        String url = "https://mms.pinduoduo.com/open.html?response_type=code&client_id=" + shop.getAppkey() + "&redirect_uri=" + URLEncoder.encode(shop.getCallbackUrl());
        return AjaxResult.success("SUCCESS",url);
    }

    @PostMapping("/getToken")
    public AjaxResult getToken(@RequestBody TokenCreateBo bo) throws IOException, InterruptedException {
        log.info("/**********获取拼多多授权token*********/");
        var shop = shopService.getById(bo.getShopId());
//        OShopPlatform platform = platformService.selectById(EnumShopType.PDD.getIndex());
        String appKey = shop.getAppkey();
        String appSercet = shop.getAppSercet();
//        ApiResultVo<Token> token = PddTokenApiHelper.getToken(shop.getAppKey(), shop.getAppSecret(), bo.getCode());

        ApiResultVo<Token> token = PddTokenApiHelper.getToken(appKey, appSercet, bo.getCode());
        if(token.getCode()==0){
            shopService.updateSessionKey(shop.getId(),token.getData().getAccess_token(),token.getData().getRefresh_token());
            return AjaxResult.success("SUCCESS");
        }else
            return AjaxResult.error(token.getMsg());
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
