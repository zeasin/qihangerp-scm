package cn.qihangerp.model.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.order.domain.AfterSale;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【scm_after_sale(售后表)】的数据库操作Service
* @createDate 2025-07-20 11:07:50
*/
public interface AfterSaleService extends IService<AfterSale> {
    PageResult<AfterSale> queryPageList(AfterSale bo, PageQuery pageQuery);
}
