package cn.qihangerp.service.goods.impl;

import cn.qihangerp.service.goods.mapper.ErpGoodsCategoryMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsCategory;
import cn.qihangerp.interfaces.goods.service.ErpGoodsCategoryService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【erp_goods_category】的数据库操作Service实现
* @createDate 2024-03-26 11:46:10
*/
@DubboService
@Service
public class ErpGoodsCategoryServiceImpl extends ServiceImpl<ErpGoodsCategoryMapper, ErpGoodsCategory>
    implements ErpGoodsCategoryService{

}




