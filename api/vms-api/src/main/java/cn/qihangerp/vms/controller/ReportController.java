package cn.qihangerp.vms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.utils.SecurityUtils;
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

    @GetMapping("/statistics")
    public AjaxResult todayDaily( HttpServletRequest request)
    {
        Integer userIdentity = SecurityUtils.getLoginUser().getUserIdentity();
        if(userIdentity !=10){
            return AjaxResult.error("登录用户不是供应商");
        }

        Map<String,Integer> result = new HashMap<>();
        Long vendorId = SecurityUtils.getLoginUser().getDeptId();

        result.put("goodsOnSale",13);
        result.put("goodsUnSale",0);
        result.put("orderWaitSend",2);

        result.put("orderTotal",1232);


        return AjaxResult.success(result);
    }



}
