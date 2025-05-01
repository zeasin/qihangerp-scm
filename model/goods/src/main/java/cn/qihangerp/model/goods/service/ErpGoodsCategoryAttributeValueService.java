package cn.qihangerp.model.goods.service;

import cn.qihangerp.model.goods.domain.ErpGoodsCategoryAttributeValue;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【erp_goods_category_attribute_value】的数据库操作Service
* @createDate 2024-06-22 17:07:17
*/
public interface ErpGoodsCategoryAttributeValueService extends IService<ErpGoodsCategoryAttributeValue> {
    List<ErpGoodsCategoryAttributeValue> queryListByCategoryAttributeId(Integer categoryAttributeId);
}
