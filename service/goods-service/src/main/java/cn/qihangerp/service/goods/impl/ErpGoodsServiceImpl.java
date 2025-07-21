package cn.qihangerp.service.goods.impl;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.goods.bo.GoodsAddBo;
import cn.qihangerp.model.goods.bo.GoodsAddSkuBo;
import cn.qihangerp.model.goods.domain.ErpGoodsSpec;
import cn.qihangerp.service.goods.mapper.ErpGoodsMapper;
import cn.qihangerp.service.goods.mapper.ErpGoodsSpecMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.goods.domain.ErpGoods;
import cn.qihangerp.model.goods.service.ErpGoodsService;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【erp_goods(商品库存管理)】的数据库操作Service实现
* @createDate 2024-03-26 10:06:36
*/

@AllArgsConstructor
@Service
public class ErpGoodsServiceImpl extends ServiceImpl<ErpGoodsMapper, ErpGoods>
    implements ErpGoodsService{
    private final ErpGoodsMapper mapper;
    private final ErpGoodsSpecMapper specMapper;
    @Override
    public PageResult<ErpGoods> queryPageList(ErpGoods goods, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpGoods> queryWrapper = new LambdaQueryWrapper<ErpGoods>()
                .eq(goods.getStatus()!=null,ErpGoods::getStatus,goods.getStatus())
                .eq(goods.getSupplierId()!=null,ErpGoods::getSupplierId,goods.getSupplierId())
                .eq(goods.getCategoryId()!=null,ErpGoods::getCategoryId,goods.getCategoryId())
                .likeLeft(StringUtils.hasText(goods.getNumber()),ErpGoods::getNumber,goods.getNumber())
                .like(StringUtils.hasText(goods.getName()),ErpGoods::getName,goods.getName())
                ;

        Page<ErpGoods> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
    @Transactional
    @Override
    public ResultVo<Long> insertGoods(String userName , GoodsAddBo bo)
    {
        if(StringUtils.isEmpty(bo.getNumber())) return ResultVo.error(500,"商品编码不能为空");
        if(StringUtils.isEmpty(bo.getName())) return ResultVo.error(500,"商品名称不能为空");
        if(bo.getSpecList()==null||bo.getSpecList().size()==0) return ResultVo.error(500,"sku不能为空");

        // 查询编码是否存在
        List<ErpGoods> goodsList = mapper.selectList(new LambdaQueryWrapper<ErpGoods>()
                .eq(ErpGoods::getNumber,bo.getNumber())
                .eq(ErpGoods::getSupplierId,bo.getSupplierId())
        );
        if(goodsList!=null && !goodsList.isEmpty()) return ResultVo.error(-1,"商品编码已存在");// return -1;


        ErpGoods goods = new ErpGoods();
        goods.setSupplierId(bo.getSupplierId());
        goods.setNumber(bo.getNumber());
        goods.setName(bo.getName());
        goods.setImage(bo.getImage());
        goods.setUnitName(bo.getUnitName());
        goods.setCategoryId(bo.getCategoryId());
        goods.setBarCode(bo.getBarCode());
        goods.setStatus(1);
        goods.setLength(0.0);
        goods.setHeight(0.0);
        goods.setWidth(0.0);
        goods.setWidth1(0.0);
        goods.setWidth2(0.0);
        goods.setWidth3(0.0);
        goods.setWeight(0.0);
        goods.setDisable(0);
        goods.setPeriod(bo.getPeriod());
        goods.setPurPrice(bo.getPurPrice());
        goods.setWholePrice(bo.getWholePrice());
        goods.setRetailPrice(bo.getRetailPrice());
        goods.setUnitCost(bo.getUnitCost());
        goods.setSupplierId(bo.getSupplierId());
        goods.setBrandId(bo.getBrandId());
        goods.setLinkUrl(bo.getLinkUrl());
        goods.setLowQty(0);
        goods.setHighQty(0);
        goods.setCreateBy(userName);
        goods.setCreateTime(new Date());
        goods.setProvince(bo.getProvince());
        goods.setCity(bo.getCity());
        goods.setTown(bo.getTown());
        goods.setShipType(bo.getShipType()==null?10:bo.getShipType());
        // 1、添加主表o_goods
        mapper.insert(goods);

        // 2、添加规格表erp_goods_spec
        for (GoodsAddSkuBo skuBo:bo.getSpecList()) {
            ErpGoodsSpec spec = new ErpGoodsSpec();
            spec.setSupplierId(goods.getSupplierId());
            spec.setGoodsId(goods.getId());
            spec.setOuterErpGoodsId(bo.getOuterErpGoodsId());
            spec.setOuterErpSkuId(skuBo.getOuterErpSkuId());
            spec.setGoodsName(bo.getName());
            spec.setGoodsNum(bo.getNumber());
            String skuName ="";
            if(StringUtils.hasText(skuBo.getColorValue()))
                skuName+= skuBo.getColorValue();
            if(StringUtils.hasText(skuBo.getSizeValue()))
                skuName+= " "+ skuBo.getSizeValue();
            if(StringUtils.hasText(skuBo.getStyleValue()))
                skuName+= " "+ skuBo.getStyleValue();

            spec.setSpecName(skuName);
            spec.setSpecNum(skuBo.getSpecNum());
            spec.setColorId(skuBo.getColorId());
            spec.setColorValue(skuBo.getColorValue());
            if(StringUtils.hasText(skuBo.getImage())){
                spec.setColorImage(skuBo.getImage());
            }else {
                if (bo.getColorImages() != null && StringUtils.hasText(bo.getColorImages().get(skuBo.getColorId()))) {
                    spec.setColorImage(bo.getColorImages().get(skuBo.getColorId()));
                } else {
                    spec.setColorImage(goods.getImage());
                }
            }
            spec.setSizeId(skuBo.getSizeId());
            spec.setSizeValue(skuBo.getSizeValue());
            spec.setStyleId(skuBo.getStyleId());
            spec.setStyleValue(skuBo.getStyleValue());
            if(skuBo.getPurPrice() == null){
                spec.setPurPrice(goods.getPurPrice());
            }else spec.setPurPrice(skuBo.getPurPrice());
            spec.setStatus(1);
            spec.setShipType(bo.getShipType()==null?10:bo.getShipType());
            spec.setVolume(skuBo.getVolume());
            spec.setWeight(skuBo.getWeight());
            spec.setHeight(skuBo.getHeight() ==null?0.0:skuBo.getHeight().doubleValue());
            spec.setLength(skuBo.getLength()==null?0.0:skuBo.getLength().doubleValue());
            spec.setWidth(skuBo.getWidth()==null?0.0:skuBo.getWidth().doubleValue());
            specMapper.insert(spec);

            // 添加商品库存表
//            OGoodsInventory inventory = new OGoodsInventory();
//            inventory.setMerchantId(goods.getMerchantId());
//            inventory.setSkuId(spec.getId());
//            inventory.setGoodsId(goods.getId());
//            inventory.setGoodsNum(bo.getNumber());
//            inventory.setSkuCode(skuBo.getSpecNum());
//            inventory.setGoodsName(goods.getName());
//            inventory.setGoodsImg(spec.getColorImage());
//            inventory.setSkuName(spec.getSkuName());
//            inventory.setQuantity(0);
//            inventory.setIsDelete(0);
//            inventory.setCreateTime(new Date());
//            inventory.setCreateBy("添加商品");
//            inventoryMapper.insert(inventory);
        }

        // 3、添加规格属性表erp_goods_spec_attr
//        if(bo.getColorValues()!=null) {
//            for (Long val:bo.getColorValues()) {
//                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
//                specAttr.setGoodsId(goods.getId());
//                specAttr.setType("color");
//                specAttr.setK("颜色");
//                specAttr.setKid(114L);
//                specAttr.setVid(val);
//                skuAttrMapper.insert(specAttr);
//            }
//
//        }
//        if(bo.getSizeValues()!=null) {
//            for (Long val:bo.getSizeValues()) {
//                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
//                specAttr.setGoodsId(goods.getId());
//                specAttr.setType("size");
//                specAttr.setK("尺码");
//                specAttr.setKid(115L);
//                specAttr.setVid(val);
//                skuAttrMapper.insert(specAttr);
//            }
//
//        }
//        if(bo.getColorValues()!=null) {
//            for (Long val:bo.getColorValues()) {
//                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
//                specAttr.setGoodsId(goods.getId());
//                specAttr.setType("style");
//                specAttr.setK("款式");
//                specAttr.setKid(116L);
//                specAttr.setVid(val);
//                skuAttrMapper.insert(specAttr);
//            }
//
//        }
//        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        return ResultVo.success(goods.getId());
    }
}




