package cn.qihangerp.api.controller.ship;

import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.interfaces.ship.domain.ErpShipLogistics;
import cn.qihangerp.interfaces.ship.service.ErpShipLogisticsService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ship/order")
public class OrderController extends BaseController {
    @DubboReference
    private ErpShipLogisticsService logisticsService;
    @GetMapping("/list")
    public TableDataInfo list(ErpShipLogistics bo, PageQuery pageQuery)
    {
        PageResult<ErpShipLogistics> pageResult = logisticsService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }

}
