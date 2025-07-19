package cn.qihangerp.vms.request;

import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.api.ShopApiParams;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.module.service.OShopPlatformService;
import cn.qihangerp.module.service.OShopService;
import cn.qihangerp.open.common.ApiResultVo;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Log
@Component
public class DouApiHelper {
    private final OShopService shopService;
//    private final OShopPlatformService platformService;

    public ApiResultVo<ShopApiParams> checkBefore(Long shopId) {
        log.info("/**************主动更新dou 参数检查****************/");
        var shop = shopService.selectShopById(shopId);

        if (shop == null) return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，没有找到店铺");

        if (shop.getType() != EnumShopType.DOU.getIndex())
            return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，店铺不是dou店铺");

       if(shop.getSellerId()==null || shop.getSellerId()<=0) return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "店铺配置错误，请配置店铺平台shop_id");

//        var thirdConfig = platformService.getById(shop.getType().longValue());
//        if (thirdConfig == null) return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "系统错误，没有找到第三方平台的配置信息");
        else if (StringUtils.isEmpty(shop.getAppKey()))
            return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "店铺配置错误，缺少appkey");
        else if (StringUtils.isEmpty(shop.getAppSecret()))
            return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "店铺配置错误，缺少appSecret");
//        else if (StringUtils.isEmpty(thirdConfig.getServerUrl()))
//            return new ApiResult<>(ResultVoEnum.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少server_url");

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(shop.getAppKey());
        params.setAppSecret(shop.getAppSecret());
        params.setAccessToken(shop.getAccessToken());
        params.setServerUrl(shop.getApiRequestUrl());
        params.setCallbackUrl(shop.getApiCallbackUrl());
        params.setSellerId(shop.getSellerId());
        if (!StringUtils.hasText(shop.getAccessToken()))
            return ApiResultVo.error(ResultVoEnum.TokenFail.getIndex(), "Token已过期，请重新授权",params);

        return ApiResultVo.success(params);
    }
}
