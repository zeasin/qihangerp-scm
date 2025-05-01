package cn.qihangerp.service.ship.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.utils.StringUtils;
import cn.qihangerp.model.ship.domain.ErpShipLogistics;
import cn.qihangerp.model.ship.service.ErpShipLogisticsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.service.ship.mapper.ErpShipLogisticsMapper;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【erp_ship_logistics】的数据库操作Service实现
* @createDate 2024-04-24 14:41:40
*/
@AllArgsConstructor

@Service
public class ErpShipLogisticsServiceImpl extends ServiceImpl<ErpShipLogisticsMapper, ErpShipLogistics>
    implements ErpShipLogisticsService {
    private final ErpShipLogisticsMapper mapper;

    @Override
    public PageResult<ErpShipLogistics> queryPageList(ErpShipLogistics bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpShipLogistics> queryWrapper = new LambdaQueryWrapper<ErpShipLogistics>()
                .eq(StringUtils.isNotEmpty(bo.getName()),ErpShipLogistics::getName,bo.getName())
                ;
        Page<ErpShipLogistics> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




