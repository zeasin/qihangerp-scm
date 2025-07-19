package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.order.domain.OOrderStocking;
import cn.qihangerp.module.order.service.OOrderStockingService;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.utils.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@AllArgsConstructor
@RestController
@RequestMapping("/report")
public class ReportController extends BaseController {
    private final OOrderStockingService orderService;
    @GetMapping("/todayDaily")
    public AjaxResult todayDaily( HttpServletRequest request)
    {
        Map<String,Long> result = new HashMap<>();
        Long userId = SecurityUtils.getLoginUser().getDeptId();
        //
        Long waitSend = orderService.list(new LambdaQueryWrapper<OOrderStocking>()
                .eq(OOrderStocking::getSupplierId,userId)
                .eq(OOrderStocking::getSendStatus,1)
                .eq(OOrderStocking::getOrderStatus,1)
        ).stream().count();

        Long hasSend = orderService.list(new LambdaQueryWrapper<OOrderStocking>()
                .eq(OOrderStocking::getSupplierId,userId)
                .eq(OOrderStocking::getSendStatus,2)
        ).stream().count();

        result.put("waitSend",waitSend);

        result.put("hasSend",hasSend);


        return AjaxResult.success(result);
    }



}
