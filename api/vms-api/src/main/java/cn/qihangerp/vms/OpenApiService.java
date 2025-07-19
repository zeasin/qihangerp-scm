package cn.qihangerp.vms;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.request.*;
import cn.qihangerp.vms.response.PddWaybillList;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "store-api")
public interface OpenApiService {
    /**
     * 拉取pdd电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/pdd/oauth/get_token")
    ApiResultVo getPddToken(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    /**
     * 拉取tao电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/tao/ewaybill/pull_shop_waybill_account")
    ApiResultVo pullTaoWaybillAccount(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    /**
     * 拉取jd电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/jd/ewaybill/pull_shop_waybill_account")
    ApiResultVo pullJdWaybillAccount(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    /**
     * 拉取pdd电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/pdd/ewaybill/pull_shop_waybill_account")
    ApiResultVo<PddWaybillList> pullPddWaybillAccount(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    @PostMapping(value = "/open/pdd/ewaybill/get_waybill_template_list")
    ApiResultVo getPddWaybillTemplateList(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    /**
     * 拉取wei电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/wei/ewaybill/pull_shop_waybill_account")
    ApiResultVo pullWeiWaybillAccount(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);

    /**
     * 拉取dou电子面单
     * @param appId
     * @return
     */
    @PostMapping(value = "/open/dou/ewaybill/pull_shop_waybill_account")
    ApiResultVo pullDouWaybillAccount(@RequestHeader(name = "appId",required = true) String appId, @RequestBody ApiPullRequest bo);
}
