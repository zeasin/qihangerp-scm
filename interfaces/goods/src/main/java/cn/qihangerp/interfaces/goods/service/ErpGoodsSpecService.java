package cn.qihangerp.interfaces.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.goods.bo.GoodsSpecBo;
import cn.qihangerp.interfaces.goods.domain.ErpGoods;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsSpec;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【erp_goods_spec(商品规格库存管理)】的数据库操作Service
* @createDate 2024-06-22 17:07:17
*/
public interface ErpGoodsSpecService extends IService<ErpGoodsSpec> {
    PageResult<ErpGoodsSpec> queryPageList(GoodsSpecBo spec, PageQuery pageQuery);
}
