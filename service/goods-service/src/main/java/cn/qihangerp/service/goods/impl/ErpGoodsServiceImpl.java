package cn.qihangerp.service.goods.impl;

import cn.qihangerp.service.goods.mapper.ErpGoodsMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.interfaces.goods.domain.ErpGoods;
import cn.qihangerp.interfaces.goods.service.ErpGoodsService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【erp_goods(商品库存管理)】的数据库操作Service实现
* @createDate 2024-03-26 10:06:36
*/
@DubboService
@AllArgsConstructor
@Service
public class ErpGoodsServiceImpl extends ServiceImpl<ErpGoodsMapper, ErpGoods>
    implements ErpGoodsService{
    private final ErpGoodsMapper mapper;
    @Override
    public PageResult<ErpGoods> queryPageList(ErpGoods goods, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpGoods> queryWrapper = new LambdaQueryWrapper<ErpGoods>();
        Page<ErpGoods> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




