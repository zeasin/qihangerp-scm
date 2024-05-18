package cn.qihangerp.interfaces.goods.service;


import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.goods.domain.ErpGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【erp_goods(商品库存管理)】的数据库操作Service
* @createDate 2024-03-26 10:06:36
*/
public interface ErpGoodsService extends IService<ErpGoods> {
    PageResult<ErpGoods> queryPageList(ErpGoods goods, PageQuery pageQuery);
}
