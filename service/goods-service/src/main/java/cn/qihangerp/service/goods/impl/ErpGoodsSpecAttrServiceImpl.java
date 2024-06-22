package cn.qihangerp.service.goods.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsSpecAttr;
import cn.qihangerp.interfaces.goods.service.ErpGoodsSpecAttrService;
import cn.qihangerp.service.goods.mapper.ErpGoodsSpecAttrMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【erp_goods_spec_attr】的数据库操作Service实现
* @createDate 2024-06-22 17:07:17
*/
@DubboService
@Service
public class ErpGoodsSpecAttrServiceImpl extends ServiceImpl<ErpGoodsSpecAttrMapper, ErpGoodsSpecAttr>
    implements ErpGoodsSpecAttrService{

}




