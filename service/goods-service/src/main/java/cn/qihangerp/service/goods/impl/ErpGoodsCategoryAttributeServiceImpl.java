package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.model.goods.domain.ErpGoodsCategoryAttribute;
import cn.qihangerp.model.goods.service.ErpGoodsCategoryAttributeService;
import cn.qihangerp.service.goods.mapper.ErpGoodsCategoryAttributeMapper;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【erp_goods_category_attribute】的数据库操作Service实现
* @createDate 2024-06-22 17:07:17
*/

@AllArgsConstructor
@Service
public class ErpGoodsCategoryAttributeServiceImpl extends ServiceImpl<ErpGoodsCategoryAttributeMapper, ErpGoodsCategoryAttribute>
    implements ErpGoodsCategoryAttributeService{
    private final ErpGoodsCategoryAttributeMapper mapper;
    @Override
    public PageResult<ErpGoodsCategoryAttribute> queryPageList(ErpGoodsCategoryAttribute bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpGoodsCategoryAttribute> queryWrapper = new LambdaQueryWrapper<ErpGoodsCategoryAttribute>()
                .eq(bo.getCategoryId()!=null,ErpGoodsCategoryAttribute::getCategoryId,bo.getCategoryId())
                ;

        Page<ErpGoodsCategoryAttribute> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




