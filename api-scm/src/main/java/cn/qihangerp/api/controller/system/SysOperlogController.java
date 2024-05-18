//package cn.qihangerp.api.controller.system;
//
//import com.qihang.common.annotation.Log;
//import com.qihang.common.enums.BusinessType;
//import com.qihang.common.utils.poi.ExcelUtil;
//import com.qihang.core.controller.BaseController;
//import com.qihang.core.domain.AjaxResult;
//import com.qihang.core.domain.SysOperLog;
//import com.qihang.core.page.TableDataInfo;
//import com.qihang.core.service.ISysOperLogService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletResponse;
//import java.util.List;
//
///**
// * 操作日志记录
// *
// * @author qihang
// */
//@RestController
//@RequestMapping("/monitor/operlog")
//public class SysOperlogController extends BaseController
//{
//    @Autowired
//    private ISysOperLogService operLogService;
//
//    @PreAuthorize("@ss.hasPermi('monitor:operlog:list')")
//    @GetMapping("/list")
//    public TableDataInfo list(SysOperLog operLog)
//    {
//        startPage(false);
//        List<SysOperLog> list = operLogService.selectOperLogList(operLog);
//        return getDataTable(list);
//    }
//
//    @Log(title = "操作日志", businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('monitor:operlog:export')")
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, SysOperLog operLog)
//    {
//        List<SysOperLog> list = operLogService.selectOperLogList(operLog);
//        ExcelUtil<SysOperLog> util = new ExcelUtil<SysOperLog>(SysOperLog.class);
//        util.exportExcel(response, list, "操作日志");
//    }
//
//    @Log(title = "操作日志", businessType = BusinessType.DELETE)
//    @PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
//    @DeleteMapping("/{operIds}")
//    public AjaxResult remove(@PathVariable Long[] operIds)
//    {
//        return toAjax(operLogService.deleteOperLogByIds(operIds));
//    }
//
//    @Log(title = "操作日志", businessType = BusinessType.CLEAN)
//    @PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
//    @DeleteMapping("/clean")
//    public AjaxResult clean()
//    {
//        operLogService.cleanOperLog();
//        return success();
//    }
//}
