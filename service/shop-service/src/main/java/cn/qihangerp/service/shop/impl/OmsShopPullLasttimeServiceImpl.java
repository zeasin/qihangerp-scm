package cn.qihangerp.service.shop.impl;

import cn.qihangerp.model.shop.domain.OmsShopPullLasttime;
import cn.qihangerp.model.shop.service.OmsShopPullLasttimeService;
import cn.qihangerp.service.shop.mapper.OmsShopPullLasttimeMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_tenant_shop_pull_lasttime(租户店铺更新最后时间记录)】的数据库操作Service实现
* @createDate 2024-06-23 11:10:08
*/
@Service
public class OmsShopPullLasttimeServiceImpl extends ServiceImpl<OmsShopPullLasttimeMapper, OmsShopPullLasttime>
    implements OmsShopPullLasttimeService {

    @Override
    public OmsShopPullLasttime getLasttimeByShop(Long shopId,String pullType) {
        List<OmsShopPullLasttime> sysShopPullLasttimes = this.baseMapper.selectList(
                new LambdaQueryWrapper<OmsShopPullLasttime>()
                        .eq(shopId!=null,OmsShopPullLasttime::getShopId, shopId)
                        .eq(OmsShopPullLasttime::getPullType, pullType)
        );
        if(sysShopPullLasttimes != null && !sysShopPullLasttimes.isEmpty()) return sysShopPullLasttimes.get(0);
        else return null;
    }
}




