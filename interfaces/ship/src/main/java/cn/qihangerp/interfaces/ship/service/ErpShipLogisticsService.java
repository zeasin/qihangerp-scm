package cn.qihangerp.interfaces.ship.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.ship.domain.ErpShipLogistics;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【erp_ship_logistics】的数据库操作Service
* @createDate 2024-04-24 14:33:49
*/
public interface ErpShipLogisticsService extends IService<ErpShipLogistics> {
    PageResult<ErpShipLogistics> queryPageList(ErpShipLogistics bo, PageQuery pageQuery);
}
