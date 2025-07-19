package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.stock.domain.ErpStockIn;
import cn.qihangerp.module.stock.domain.ErpVendorStockIn;
import cn.qihangerp.module.stock.request.StockInCreateRequest;
import cn.qihangerp.module.stock.request.StockInRequest;
import cn.qihangerp.module.stock.service.ErpStockInService;
import cn.qihangerp.module.stock.service.ErpVendorStockInService;

import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/stockIn")
public class StockInController extends BaseController {

    private final ErpVendorStockInService stockInService;
    @GetMapping("/list")
    public TableDataInfo list(ErpVendorStockIn bo, PageQuery pageQuery, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        bo.setVendorId(userId);
        var pageList = stockInService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }

    @PostMapping("/create")
    public AjaxResult createEntry(@RequestBody StockInCreateRequest param, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        param.setMerchantId(userId);
        ResultVo<Long> resultVo = stockInService.createEntry(userId, "", param);
        if(resultVo.getCode()==0)
            return AjaxResult.success();
        else return AjaxResult.error(resultVo.getMsg());
    }

    @PostMapping("/in")
    public AjaxResult in(@RequestBody StockInRequest param, HttpServletRequest request)
    {
//        Long userId = JwtUtils.getUserIdFromToken(request);
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        ResultVo<Long> resultVo = stockInService.stockIn(userId, "", param);
        if(resultVo.getCode()==0)
            return AjaxResult.success();
        else return AjaxResult.error(resultVo.getMsg());
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        ErpVendorStockIn entry = stockInService.getDetailAndItemById(id);

        return success(entry);
    }

}
