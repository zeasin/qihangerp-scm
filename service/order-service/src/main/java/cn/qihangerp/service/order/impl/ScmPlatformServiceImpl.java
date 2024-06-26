package cn.qihangerp.service.order.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.interfaces.order.domain.ScmPlatform;
import cn.qihangerp.interfaces.order.service.ScmPlatformService;
import cn.qihangerp.service.order.mapper.ScmPlatformMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【scm_platform(电商平台配置表)】的数据库操作Service实现
* @createDate 2024-06-23 13:28:41
*/
@DubboService
@Service
public class ScmPlatformServiceImpl extends ServiceImpl<ScmPlatformMapper, ScmPlatform>
    implements ScmPlatformService{

}




