package cn.qihangerp.service.goods.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsAttribute;
import cn.qihangerp.interfaces.goods.service.ErpGoodsAttributeService;
import cn.qihangerp.service.goods.mapper.ErpGoodsAttributeMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【erp_goods_attribute(商品属性表)】的数据库操作Service实现
* @createDate 2024-06-22 17:07:00
*/
@DubboService
@Service
public class ErpGoodsAttributeServiceImpl extends ServiceImpl<ErpGoodsAttributeMapper, ErpGoodsAttribute>
    implements ErpGoodsAttributeService{

}




