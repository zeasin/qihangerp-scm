package cn.qihangerp.model.shop.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.shop.domain.Vendor;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【scm_vendor】的数据库操作Service
* @createDate 2025-07-20 08:04:48
*/
public interface VendorService extends IService<Vendor> {
    PageResult<Vendor> queryPageList(Vendor bo, PageQuery pageQuery);
    Vendor getByLoginName(String loginName);
}
