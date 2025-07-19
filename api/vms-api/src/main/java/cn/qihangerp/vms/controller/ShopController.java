package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import cn.qihangerp.vms.domain.ErpVendorShop;
import cn.qihangerp.vms.service.ErpVendorShopService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class ShopController extends BaseController {
    private final ErpVendorShopService erpVendorShopService;

    /**
     * 查询店铺列表logistics
     */
    @GetMapping("/list")
    public TableDataInfo list(ErpVendorShop shop, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        shop.setVendorId(userId);
        List<ErpVendorShop> list = erpVendorShopService.selectShopList(shop);
        return getDataTable(list);
    }

    @GetMapping("/pageList")
    public TableDataInfo pageList(ErpVendorShop shop, PageQuery pageQuery, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        shop.setVendorId(userId);
        PageResult<ErpVendorShop> pageList = erpVendorShopService.queryPageList(shop, pageQuery);
        return getDataTable(pageList);
    }


    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/detail/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(erpVendorShopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ErpVendorShop shop, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        shop.setVendorId(userId);
        return toAjax(erpVendorShopService.insertShop(shop));
    }

    /**
     * 修改店铺
     */
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody ErpVendorShop shop)
    {
        if(shop.getId()==null) return AjaxResult.error("缺少参数：id");
        erpVendorShopService.updateShopById(shop);
        return toAjax(1);
    }

    /**
     * 删除店铺
     */
    @DeleteMapping("/del/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(erpVendorShopService.deleteShopByIds(ids));
    }
}
