package cn.qihangerp.store.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.goods.domain.ShopGoods;
import cn.qihangerp.model.goods.domain.ShopGoodsSku;
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
import cn.qihangerp.sdk.pdd.PullRequest;
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
        if(!org.springframework.util.StringUtils.hasText(shop.getServerUrl())) {
            return AjaxResult.error("店铺参数配置错误，没有找到ApiRequestUrl");
        }
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
         if (shop.getType()==300) {
            // 拼多多

            String accessToken = shop.getAccessToken();
//            String serverUrl = checkResult.getData().getServerUrl();
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
                goods.setProductId(g.getGoodsId().toString());
                goods.setTitle(g.getGoodsName());
                goods.setSubTitle("");
                goods.setHeadImg(g.getThumbUrl());
                goods.setHeadImgs("");
                goods.setDescInfo("");
                goods.setAttrs("");
                goods.setStatus(g.getIsOnsale());
                goods.setEditStatus(0);
                goods.setMinPrice(0);

                goods.setProductType(1);
                goods.setEditTime(g.getCreatedAt()+"");
                String outerGoodsId="";
                List<ShopGoodsSku> skuList = new ArrayList<>();
                for (var sku : g.getSkuList()) {
                    ShopGoodsSku goodsSku = new ShopGoodsSku();
                    goodsSku.setMerchantId(goods.getMerchantId());
                    goodsSku.setShopId(goods.getShopId());
                    goodsSku.setShopType(shop.getType());
                    goodsSku.setSkuId(sku.getSkuId().toString());
                    goodsSku.setProductId(goods.getProductId());
                    goodsSku.setOutSkuId(sku.getOuterId());
                    goodsSku.setThumbImg(goods.getHeadImg());
                    goodsSku.setSkuCode(sku.getOuterId());
                    outerGoodsId = sku.getOuterGoodsId();
                    goodsSku.setSkuAttrs(sku.getSpec_details());
                    goodsSku.setSalePrice(0);
                    goodsSku.setSkuName(sku.getSpec());
                    goodsSku.setStockNum(sku.getSkuQuantity());
                    goodsSku.setStatus(goods.getStatus());
                    goodsSku.setSkuDeliverInfo("");
                    goodsSku.setQuantity(sku.getSkuQuantity());
                    skuList.add(goodsSku);
                }
                goods.setSpuCode(outerGoodsId);
                goods.setOutProductId(outerGoodsId);
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

        }else if (shop.getType()==4) {
            // 抖店
            var checkResult = douApiCommon.checkBefore(params.getShopId());
            if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
//            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
                ErpShopPullLogs logs = new ErpShopPullLogs();
                logs.setTenantId(getUserId());
                logs.setShopType(EnumShopType.PDD.getIndex());
                logs.setShopId(params.getShopId());
                logs.setPullType("GOODS");
                logs.setPullWay("主动拉取");
                logs.setPullParams("{}");
                logs.setPullResult("{insert:0,update:0,fail:0}");
                logs.setPullTime(currDateTime);
                logs.setDuration(System.currentTimeMillis() - beginTime);
                pullLogsService.save(logs);
                return AjaxResult.error(1401,checkResult.getMsg());
            }
            String accessToken = checkResult.getData().getAccessToken();
//            String serverUrl = checkResult.getData().getServerUrl();
            String appKey = checkResult.getData().getAppKey();
            String appSecret = checkResult.getData().getAppSecret();

            var resultVo = DouGoodsApiHelper.getGoodsList(appKey,appSecret,accessToken,1,20);
//            if(resultVo.getCode() == 10019) return AjaxResult.error(HttpStatus.UNAUTHORIZED,"Token已过期");
            if(resultVo.getCode() !=0 ){
                ErpShopPullLogs logs = new ErpShopPullLogs();
                logs.setTenantId(getUserId());
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
                goods.setTenantId(getUserId());
                goods.setShopId(params.getShopId());
                goods.setShopType(shop.getType());
                goods.setProductId(g.getProductId().toString());
                goods.setTitle(g.getName());
                goods.setSubTitle("");
                goods.setHeadImg(g.getImg());
                goods.setHeadImgs("");
                goods.setDescInfo(g.getDescription());
                goods.setAttrs(JSONObject.toJSONString(g.getExtra()));
                goods.setStatus(g.getStatus());
                goods.setEditStatus(g.getCheckStatus());
                goods.setMinPrice(g.getDiscountPrice());
                goods.setMarketPrice(g.getMarketPrice());
                goods.setProductType(g.getProductType());
                goods.setEditTime(g.getUpdateTime()+"");
                goods.setCreateTime(g.getCreateTime()+"");
                goods.setCreateOn(new Date());
                goods.setOutProductId(g.getOuterProductId());

                List<ShopGoodsSku> skuList = new ArrayList<>();
                for (var sku : g.getSkuList()) {
                    ShopGoodsSku goodsSku = new ShopGoodsSku();
                    goodsSku.setTenantId(goods.getTenantId());
                    goodsSku.setShopId(goods.getShopId());
                    goodsSku.setShopType(shop.getType());
                    goodsSku.setSkuId(sku.getId().toString());
                    goodsSku.setProductId(goods.getProductId());
                    goodsSku.setOutProductId(goods.getOutProductId());
                    goodsSku.setOutSkuId(sku.getCode());
//                    goodsSku.setThumbImg(goods.getHeadImg());
                    goodsSku.setSkuCode(sku.getCode());
                    goodsSku.setCreateTime(sku.getCreateTime());
                    goodsSku.setSkuAttrs(JSONObject.toJSONString(sku.getSellProperties()));
                    goodsSku.setSalePrice(sku.getPrice());
                    String skuName = "";
                    if(org.springframework.util.StringUtils.hasText(sku.getSpecDetailName1())){
                        skuName+=sku.getSpecDetailName1();
                    }
                    if(org.springframework.util.StringUtils.hasText(sku.getSpecDetailName2())){
                        skuName+=sku.getSpecDetailName2();
                    }
                    if(org.springframework.util.StringUtils.hasText(sku.getSpecDetailName3())){
                        skuName+=sku.getSpecDetailName3();
                    }
                    goodsSku.setSkuName(skuName);
                    goodsSku.setStockNum(sku.getStockNum());
                    goodsSku.setStatus(sku.isSkuStatus()?1:0);
//                    goodsSku.setSkuDeliverInfo("");
//                    goodsSku.setQuantity(sku.getSkuQuantity());
                    skuList.add(goodsSku);
                }
//                goods.setSpuCode(outerGoodsId);
                goods.setSkus(skuList);
//
                var result = shopGoodsService.saveAndUpdateGoods(params.getShopId(), goods);
                if (result.getCode() == 0) {
                    insert++;
                    log.info("====添加DOU商品=====insert");
                } else if (result.getCode() == ResultVoEnum.UPDATE_SUCCESS.getIndex()) {
                    update++;
                    log.info("====更新DOU商品=====update");
                } else {
                    fail++;
                    log.info("====拉取DOU商品=====fail");
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
