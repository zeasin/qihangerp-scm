package cn.qihangerp.api.controller.channel;

import cn.qihangerp.api.domain.ScmDistributor;
import cn.qihangerp.api.domain.bo.DistributorBo;
import cn.qihangerp.api.service.ScmDistributorService;
import cn.qihangerp.common.*;

import cn.qihangerp.common.utils.SecurityUtils;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@AllArgsConstructor
@RequestMapping("/channel")
@RestController
public class DistributorController extends BaseController {
    private final ScmDistributorService distributorService;
    @GetMapping("/distributor_list")
    public TableDataInfo list(DistributorBo bo, PageQuery pageQuery)
    {
        PageResult<ScmDistributor> pageResult = distributorService.queryPageList(bo, pageQuery);
        //
        return getDataTable(pageResult);
    }

    /**
     * 获取店铺详细信息
     */
    @GetMapping(value = "/distributor/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(distributorService.selectUserByUserId(id));
    }

    /**
     * 新增店铺
     */
    @PostMapping("/distributor")
    public AjaxResult add(@RequestBody ScmDistributor user)
    {
        ScmDistributor scmDistributor = distributorService.selectUserByUserName(user.getUserName());
        if(scmDistributor!=null){
            return AjaxResult.error("登录账号已存在");
        }
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setCreateTime(new Date());
//        shop.setUpdateTime(new Date());
        return toAjax(distributorService.save(user));
    }

    /**
     * 修改店铺
     */
    @PutMapping("/distributor")
    public AjaxResult edit(@RequestBody ScmDistributor shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(distributorService.updateById(shop));
    }
}
