package cn.qihangerp.store.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
import cn.qihangerp.model.goods.service.ShopGoodsService;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.domain.OmsShopPullLogs;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import cn.qihangerp.model.shop.service.OmsShopPullLogsService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.dou.DouGoodsApiHelper;
import cn.qihangerp.open.pdd.PddGoodsApiHelper;
import cn.qihangerp.open.pdd.model.GoodsResultVo;
import cn.qihangerp.open.wei.WeiGoodsApiService;
import cn.qihangerp.open.wei.model.Product;
import cn.qihangerp.store.request.PullRequest;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@Slf4j
@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController extends BaseController {
    private final ShopGoodsService shopGoodsService;
    private final OmsMerchantShopService shopService;
    private final WeiGoodsApiService goodsApiService;
    private final OmsShopPullLogsService pullLogsService;

    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public AjaxResult pullGoods(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return AjaxResult.error("参数错误，没有店铺Id");
        }
        OmsMerchantShop shop = shopService.getById(params.getShopId());
        if(shop==null) return AjaxResult.error("店铺不存在");
        if(!org.springframework.util.StringUtils.hasText(shop.getAppkey())) {
            return AjaxResult.error("店铺参数配置错误，没有找到AppKey");
        }
        if(!org.springframework.util.StringUtils.hasText(shop.getAppSercet())) {
            return AjaxResult.error("店铺参数配置错误，没有找到AppSercet");
        }
//        if(!org.springframework.util.StringUtils.hasText(shop.getServerUrl())) {
//            return AjaxResult.error("店铺参数配置错误，没有找到ApiRequestUrl");
//        }
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = 0l;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0l;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }

        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();
        int total = 0;
        int insert = 0;
        int update = 0;
        int fail = 0;
         if (shop.getType()==EnumShopType.PDD.getIndex()) {
            // 拼多多
            String accessToken = shop.getAccessToken();
            String appKey = shop.getAppkey();
            String appSecret = shop.getAppSercet();

            ApiResultVo<GoodsResultVo> resultVo = PddGoodsApiHelper.pullGoodsList(appKey, appSecret, accessToken, 1, 20);
//            if(resultVo.getCode() == 10019) return AjaxResult.error(HttpStatus.UNAUTHORIZED,"Token已过期");
            if(resultVo.getCode() !=0 ){
                OmsShopPullLogs logs = new OmsShopPullLogs();
                logs.setMerchantId(merchantId);
                logs.setShopType(EnumShopType.PDD.getIndex());
                logs.setShopId(params.getShopId());
                logs.setPullType("GOODS");
                logs.setPullWay("主动拉取");
                logs.setPullParams("{}");
                logs.setPullResult("{insert:0,update:0,fail:0}");
                logs.setPullTime(currDateTime);
                logs.setDuration(System.currentTimeMillis() - beginTime);
                pullLogsService.save(logs);
                return AjaxResult.error("接口拉取错误："+resultVo.getMsg());
            }
            for (var g : resultVo.getData().getGoodsList()) {
                total++;
                ShopGoods goods = new ShopGoods();
                goods.setMerchantId(merchantId);
                goods.setShopId(params.getShopId());
                goods.setShopType(shop.getType());
                goods.setPlatformProductId(g.getGoodsId().toString());
                goods.setTitle(g.getGoodsName());
                goods.setSubTitle("");
                goods.setImg(g.getThumbUrl());
                goods.setImgs("");
                goods.setDescInfo("");
                goods.setAttrs("");
                goods.setStatus(g.getIsOnsale());
                goods.setStatus(0);
                goods.setMinPrice(0);
                goods.setQuantity(g.getGoodsQuantity());
                goods.setDeliverMethod(0);
                goods.setAddTime(g.getCreatedAt());
                goods.setEditTime(g.getCreatedAt());
                goods.setErpGoodsId(0L);
                String outerGoodsId="";
                List<ShopGoodsSku> skuList = new ArrayList<>();
                for (var sku : g.getSkuList()) {
                    ShopGoodsSku goodsSku = new ShopGoodsSku();
                    goodsSku.setMerchantId(goods.getMerchantId());
                    goodsSku.setShopId(goods.getShopId());
                    goodsSku.setShopType(shop.getType());
                    goodsSku.setPlatformSkuId(sku.getSkuId().toString());
                    goodsSku.setPlatformProductId(goods.getPlatformProductId());
                    goodsSku.setOuterSkuId(sku.getOuterId());
                    goodsSku.setImg(goods.getImg());
                    goodsSku.setSkuCode(sku.getOuterId());
                    outerGoodsId = sku.getOuterGoodsId();
                    goodsSku.setSkuAttrs(sku.getSpec());
                    goodsSku.setPrice(0);
                    goodsSku.setSkuName(sku.getSpec());
                    goodsSku.setStockNum(sku.getSkuQuantity());
                    goodsSku.setStatus(goods.getStatus());
                    goodsSku.setAddTime(goods.getAddTime());
                    goodsSku.setErpGoodsId(0L);
                    goodsSku.setErpGoodsSkuId(0L);
                    skuList.add(goodsSku);
                }
                goods.setSpuCode(outerGoodsId);
                goods.setOuterProductId(outerGoodsId);
                goods.setSkus(skuList);

                var result = shopGoodsService.saveAndUpdateGoods(params.getShopId(), goods);
                log.info("拉取更新商品====结果：{}",result.getMsg());
                if (result.getCode() == 0) {
                    insert++;
                } else if (result.getCode() == ResultVoEnum.UPDATE_SUCCESS.getIndex()) {
                    update++;
                } else {
                    log.error("拉取更新商品错误{}",result.getMsg());
                    fail++;
                }
            }

        }else{
            // 未知平台，不支持
            return AjaxResult.error("未知平台，不支持");
        }

        Map<String, Object> data = new HashMap<>();
        data.put("insert", insert);
        data.put("update", update);
        data.put("fail", fail);
        data.put("total", total);
        return AjaxResult.success(data);

    }
}
