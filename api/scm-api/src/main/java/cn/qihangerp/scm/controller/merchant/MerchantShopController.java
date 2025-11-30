package cn.qihangerp.scm.controller.merchant;

import cn.qihangerp.common.*;
import cn.qihangerp.common.utils.SecurityUtils;
import cn.qihangerp.model.shop.domain.OmsMerchantShop;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 店铺Controller
 * 
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class MerchantShopController extends BaseController {

    private final OmsMerchantShopService shopService;

    /**
     * 查询店铺列表(只能查询自己的店铺)
     */
    @GetMapping("/list")
    public TableDataInfo list(OmsMerchantShop shop)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = null;
        if(userIdentity == null||userIdentity==0){
            merchantId = 0L;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
        }else{
            merchantId = -1L;
        }
        shop.setMerchantId(merchantId);
        List<OmsMerchantShop> list = shopService.selectShopList(shop);
        return getDataTable(list);
    }

    @GetMapping("/pageList")
    public TableDataInfo pageList(OmsMerchantShop shop, PageQuery pageQuery)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        Long merchantId = null;
        if(userIdentity == null||userIdentity==0){
//            merchantId = shop.getMerchantId();
//            merchantId = null;
        }else if(userIdentity==20){
            merchantId = SecurityUtils.getDeptId();
            shop.setMerchantId(merchantId);
        }else{
            merchantId = -1L;
        }

        PageResult<OmsMerchantShop> pageList = shopService.queryPageList(shop, pageQuery);
        return getDataTable(pageList);
    }


    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/shop/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody OmsMerchantShop shop)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        if(userIdentity == null||userIdentity==10){
            return AjaxResult.error("没有权限添加店铺");
        }else if(userIdentity==20){
            shop.setMerchantId(SecurityUtils.getUserId());
        }else if(userIdentity==0){
            shop.setMerchantId(0L);
        }
        shop.setCreateTime(new Date());
        shop.setCreateBy(SecurityUtils.getUsername());

        return toAjax(shopService.save(shop));
    }

    /**
     * 修改店铺
     */
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody OmsMerchantShop shop)
    {
        if(shop.getId()==null) return AjaxResult.error("缺少参数：id");
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        if(userIdentity == null||userIdentity==10){
            return AjaxResult.error("没有权限修改店铺");
        }
        shop.setUpdateTime(new Date());
        shop.setUpdateBy(SecurityUtils.getUsername());
        shopService.updateById(shop);

        return toAjax(1);
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/shop/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        if(userIdentity == null||userIdentity==10){
            return AjaxResult.error("没有权限删除店铺");
        }
        return toAjax(shopService.removeBatchByIds(Arrays.stream(ids).toList()));
    }

}
