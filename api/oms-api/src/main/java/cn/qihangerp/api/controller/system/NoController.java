package cn.qihangerp.api.controller.system;

import cn.qihangerp.common.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

@RestController
public class NoController {

    @RequestMapping("/system/dict-data/simple-list")
    public AjaxResult a(){
        return AjaxResult.success(new ArrayList<>());
    }

    @GetMapping("/system/auth/get-permission-info")
    public AjaxResult getPermissionInfo() {
        return AjaxResult.success(new ArrayList<>());
    }

}
