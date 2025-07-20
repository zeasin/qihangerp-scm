package cn.qihangerp.api.controller.merchant;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.model.shop.domain.ErpShopPlatform;
import cn.qihangerp.model.shop.service.ErpShopPlatformService;
import cn.qihangerp.model.shop.service.OmsMerchantShopService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 店铺Controller
 * 
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class ShopPlatformController extends BaseController {
    private final OmsMerchantShopService shopService;
    private final ErpShopPlatformService shopPlatformService;

    @GetMapping("/platformList")
    public TableDataInfo platformList(ErpShopPlatform bo)
    {
        LambdaQueryWrapper<ErpShopPlatform> qw = new LambdaQueryWrapper<>();
        qw.eq(bo.getStatus()!=null,ErpShopPlatform::getStatus,bo.getStatus());
        if(bo.getStatus()!=null) {
            qw.last(" ORDER BY sort asc");
        }
        List<ErpShopPlatform> list = shopPlatformService.list(qw);
        return getDataTable(list);
    }



    @GetMapping(value = "/platform/{id}")
    public AjaxResult getPlatform(@PathVariable("id") Long id)
    {
        return success(shopPlatformService.getById(id));
    }



    /**
     * 修改平台
     * @param
     * @return
     */
    @PutMapping("/platform")
    public AjaxResult edit(@RequestBody ErpShopPlatform platform)
    {
        platform.setStatus(null);
        return toAjax(shopPlatformService.updateById(platform));
    }

    /**
     * 状态修改
     */
    @PutMapping("/platform/changeStatus")
    public AjaxResult changeStatus(@RequestBody ErpShopPlatform platform)
    {

        return toAjax(shopPlatformService.updateById(platform));
    }

}
