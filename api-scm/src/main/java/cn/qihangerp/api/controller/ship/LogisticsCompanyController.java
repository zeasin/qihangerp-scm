package cn.qihangerp.api.controller.ship;

import cn.qihangerp.common.*;
import cn.qihangerp.interfaces.ship.domain.ErpShipLogistics;
import cn.qihangerp.interfaces.ship.service.ErpShipLogisticsService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 物流公司Controller
 *
 * @author qihang
 * @date 2024-01-12
 */
@RestController
@RequestMapping("/ship/logistics")
public class LogisticsCompanyController extends BaseController
{
    @DubboReference
    private ErpShipLogisticsService logisticsService;

    /**
     * 查询物流公司列表
     */
    @PreAuthorize("@ss.hasPermi('api:logistics:list')")
    @GetMapping("/company_list")
    public TableDataInfo list(ErpShipLogistics bo, PageQuery pageQuery)
    {
        PageResult<ErpShipLogistics> pageResult = logisticsService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }


    /**
     * 获取物流公司详细信息
     */
    @PreAuthorize("@ss.hasPermi('api:logistics:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(logisticsService.getById(id));
    }

    /**
     * 新增物流公司
     */
    @PreAuthorize("@ss.hasPermi('api:logistics:add')")
    @PostMapping
    public AjaxResult add(@RequestBody ErpShipLogistics bo)
    {
        return toAjax(logisticsService.save(bo));
    }

    /**
     * 修改物流公司
     */
    @PreAuthorize("@ss.hasPermi('api:logistics:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody ErpShipLogistics bo)
    {
        return toAjax(logisticsService.updateById(bo));
    }

    /**
     * 删除物流公司
     */
    @PreAuthorize("@ss.hasPermi('api:logistics:remove')")
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(logisticsService.removeBatchByIds(Arrays.stream(ids).toList()));
    }
}
