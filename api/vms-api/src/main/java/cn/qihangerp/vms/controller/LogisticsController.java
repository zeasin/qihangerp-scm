package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.domain.ErpLogisticsCompany;
import cn.qihangerp.module.service.ErpLogisticsCompanyService;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/logistics")
public class LogisticsController extends BaseController {
    private final ErpLogisticsCompanyService logisticsCompanyService;
    @GetMapping("/company_list")
    public TableDataInfo logisticsStatusList(String name, Integer status, Integer shopType, Integer shopId, HttpServletRequest request)
    {
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        List<ErpLogisticsCompany> list = logisticsCompanyService.queryListByStatus(name,status, shopType, shopId, userId);
        return getDataTable(list);
    }
//    @GetMapping("/company_list")
//    public TableDataInfo logisticsList(Integer type, Integer shopId, PageQuery pageQuery)
//    {
//        PageResult<OLogisticsCompany> result = logisticsCompanyService.queryPageList(type, shopId, pageQuery);
//        return getDataTable(result);
//    }

    /**
     * 新增物流公司
     */
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ErpLogisticsCompany company, HttpServletRequest request)
    {
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        company.setSupplierId(userId);
        return toAjax(logisticsCompanyService.save(company));
    }

    @PutMapping("/updateStatus")
    public AjaxResult logisticsUpdateStatus(@RequestBody ErpLogisticsCompany company)
    {
        Integer newStatus = null;
        if(company.getStatus()==null || company.getStatus().intValue() ==0){
            newStatus = 1;
        }else{
            newStatus = 0;
        }
        return toAjax(logisticsCompanyService.updateStatus(company.getId(),newStatus));
    }
}
