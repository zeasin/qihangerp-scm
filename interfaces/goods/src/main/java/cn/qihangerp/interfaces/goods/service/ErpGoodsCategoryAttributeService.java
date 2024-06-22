package cn.qihangerp.interfaces.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.goods.domain.ErpGoods;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsCategoryAttribute;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【erp_goods_category_attribute】的数据库操作Service
* @createDate 2024-06-22 17:07:17
*/
public interface ErpGoodsCategoryAttributeService extends IService<ErpGoodsCategoryAttribute> {
    PageResult<ErpGoodsCategoryAttribute> queryPageList(ErpGoodsCategoryAttribute bo, PageQuery pageQuery);
}
