package cn.qihangerp.api.controller.afterSale;

import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.model.order.domain.AfterSale;
import cn.qihangerp.model.order.service.AfterSaleService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/afterSale")
public class AfterSaleController extends BaseController {
    private AfterSaleService afterSaleService;

    @GetMapping("/returned_list")
    public TableDataInfo returned_list(AfterSale bo, PageQuery pageQuery)
    {
        PageResult<AfterSale> pageResult = afterSaleService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }


    @GetMapping("/exchange_list")
    public TableDataInfo exchange_list(AfterSale bo, PageQuery pageQuery)
    {
        PageResult<AfterSale> pageResult = afterSaleService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }



    @GetMapping("/intercept_list")
    public TableDataInfo intercept_list(AfterSale bo, PageQuery pageQuery)
    {
        PageResult<AfterSale> pageResult = afterSaleService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }


    @GetMapping("/ship_again_list")
    public TableDataInfo ship_again_list(AfterSale bo, PageQuery pageQuery)
    {
        PageResult<AfterSale> pageResult = afterSaleService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }
}
