package cn.qihangerp.service.goods.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsCategoryAttributeValue;
import cn.qihangerp.interfaces.goods.service.ErpGoodsCategoryAttributeValueService;
import cn.qihangerp.service.goods.mapper.ErpGoodsCategoryAttributeValueMapper;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【erp_goods_category_attribute_value】的数据库操作Service实现
* @createDate 2024-06-22 17:07:17
*/
@AllArgsConstructor
@DubboService
@Service
public class ErpGoodsCategoryAttributeValueServiceImpl extends ServiceImpl<ErpGoodsCategoryAttributeValueMapper, ErpGoodsCategoryAttributeValue>
    implements ErpGoodsCategoryAttributeValueService{
    private final ErpGoodsCategoryAttributeValueMapper mapper;

    @Override
    public List<ErpGoodsCategoryAttributeValue> queryListByCategoryAttributeId(Integer categoryAttributeId) {
        LambdaQueryWrapper qw = new LambdaQueryWrapper<ErpGoodsCategoryAttributeValue>()
                .eq(ErpGoodsCategoryAttributeValue::getCategoryAttributeId,categoryAttributeId);
        return mapper.selectList(qw);
    }
}




