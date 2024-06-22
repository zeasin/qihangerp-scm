package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.goods.bo.GoodsSpecBo;
import cn.qihangerp.interfaces.goods.domain.ErpGoods;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.goods.domain.ErpGoodsSpec;
import cn.qihangerp.interfaces.goods.service.ErpGoodsSpecService;
import cn.qihangerp.service.goods.mapper.ErpGoodsSpecMapper;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【erp_goods_spec(商品规格库存管理)】的数据库操作Service实现
* @createDate 2024-06-22 17:07:17
*/
@AllArgsConstructor
@DubboService
@Service
public class ErpGoodsSpecServiceImpl extends ServiceImpl<ErpGoodsSpecMapper, ErpGoodsSpec>
    implements ErpGoodsSpecService{
    private final ErpGoodsSpecMapper mapper;
    @Override
    public PageResult<ErpGoodsSpec> queryPageList(GoodsSpecBo goods, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpGoodsSpec> queryWrapper = new LambdaQueryWrapper<ErpGoodsSpec>()
                .eq(goods.getStatus()!=null,ErpGoodsSpec::getStatus,goods.getStatus())
                .eq(goods.getGoodsId()!=null,ErpGoodsSpec::getGoodsId,goods.getGoodsId())
                .eq(StringUtils.hasText(goods.getSpecNum()),ErpGoodsSpec::getSpecNum,goods.getSpecNum())
                ;

        Page<ErpGoodsSpec> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




