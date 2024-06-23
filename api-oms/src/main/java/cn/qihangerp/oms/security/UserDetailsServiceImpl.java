package cn.qihangerp.oms.security;

import cn.qihangerp.common.enums.UserStatus;
import cn.qihangerp.common.exception.ServiceException;
import cn.qihangerp.common.utils.MessageUtils;
import cn.qihangerp.common.utils.StringUtils;
import cn.qihangerp.oms.domain.OmsTenant;
import cn.qihangerp.oms.service.OmsTenantService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户验证处理
 *
 * @author qihang
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private OmsTenantService tenantService;
    @Autowired
    private UserPasswordService passwordService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        OmsTenant tenant = tenantService.selectUserByUserName(username);
        if (StringUtils.isNull(tenant))
        {
            log.info("登录用户：{} 不存在.", username);
            throw new ServiceException(MessageUtils.message("user.not.exists"));
        }
        else if (UserStatus.DELETED.getCode().equals(tenant.getDelFlag()))
        {
            log.info("登录用户：{} 已被删除.", username);
            throw new ServiceException(MessageUtils.message("user.password.delete"));
        }
        else if (UserStatus.DISABLE.getCode().equals(tenant.getStatus()))
        {
            log.info("登录用户：{} 已被停用.", username);
            throw new ServiceException(MessageUtils.message("user.blocked"));
        }

        passwordService.validate(tenant);

        return createLoginUser(tenant);
    }

    public UserDetails createLoginUser(OmsTenant tenant)
    {
        Set<String> perms = new HashSet<String>();
        perms.add("*:*:*");
//        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
        return new LoginTenant(tenant.getId(), tenant, perms);
    }
}
