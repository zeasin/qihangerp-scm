//package cn.qihangerp.api.controller.system;
//
//
//import cn.qihangerp.common.BaseController;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.*;
//import java.util.List;
//
//
///**
// * 系统访问记录
// *
// * @author qihang
// */
//@RestController
//@RequestMapping("/monitor/logininfor")
//public class SysLogininforController extends BaseController
//{
//    @Autowired
//    private ISysLogininforService logininforService;
//
//    @Autowired
//    private SysPasswordService passwordService;
//
//    @PreAuthorize("@ss.hasPermi('monitor:logininfor:list')")
//    @GetMapping("/list")
//    public TableDataInfo list(SysLogininfor logininfor)
//    {
//        startPage(false);
//        List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
//        return getDataTable(list);
//    }
//
//    @Log(title = "登录日志", businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('monitor:logininfor:export')")
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, SysLogininfor logininfor)
//    {
//        List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
//        ExcelUtil<SysLogininfor> util = new ExcelUtil<SysLogininfor>(SysLogininfor.class);
//        util.exportExcel(response, list, "登录日志");
//    }
//
//    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
//    @Log(title = "登录日志", businessType = BusinessType.DELETE)
//    @DeleteMapping("/{infoIds}")
//    public AjaxResult remove(@PathVariable Long[] infoIds)
//    {
//        return toAjax(logininforService.deleteLogininforByIds(infoIds));
//    }
//
//    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
//    @Log(title = "登录日志", businessType = BusinessType.CLEAN)
//    @DeleteMapping("/clean")
//    public AjaxResult clean()
//    {
//        logininforService.cleanLogininfor();
//        return success();
//    }
//
//    @PreAuthorize("@ss.hasPermi('monitor:logininfor:unlock')")
//    @Log(title = "账户解锁", businessType = BusinessType.OTHER)
//    @GetMapping("/unlock/{userName}")
//    public AjaxResult unlock(@PathVariable("userName") String userName)
//    {
//        passwordService.clearLoginRecordCache(userName);
//        return success();
//    }
//}
