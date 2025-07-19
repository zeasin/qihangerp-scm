package cn.qihangerp.vms.config;


import cn.qihangerp.common.ServiceException;
import cn.qihangerp.common.enums.UserStatus;
import cn.qihangerp.domain.vo.UserVo;
import cn.qihangerp.module.domain.SysUser;
import cn.qihangerp.module.service.ISysUserService;
import cn.qihangerp.security.LoginUser;
import cn.qihangerp.security.UserPasswordService;
import cn.qihangerp.utils.MessageUtils;
import cn.qihangerp.utils.StringUtils;
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
    private ISysUserService userService;
    @Autowired
    private UserPasswordService passwordService;
//    @Autowired
//    private SysPasswordService passwordService;

//    @Autowired
//    private SysPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        SysUser user = userService.selectUserByUserName(username);
        if (StringUtils.isNull(user))
        {
            log.info("登录用户：{} 不存在.", username);
            throw new ServiceException(MessageUtils.message("user.not.exists"));
        }
        else if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            log.info("登录用户：{} 已被删除.", username);
            throw new ServiceException(MessageUtils.message("user.password.delete"));
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 已被停用.", username);
            throw new ServiceException(MessageUtils.message("user.blocked"));
        }
        //用户类型（00系统用户10供应商20商户）
        Integer userIdentity = null;
        if(user.getUserType().equals("00")){
            userIdentity=0;
        }else if(user.getUserType().equals("20")){
            userIdentity = 20;
        }else if(user.getUserType().equals("10")){
            userIdentity = 10;
        }
        UserVo userVo = new UserVo();
        userVo.setUserIdentity(userIdentity);
        userVo.setUserId(user.getUserId());
        userVo.setDeptId(user.getDeptId());
        userVo.setCreateTime(user.getCreateTime());
        userVo.setUserName(user.getUserName());
        userVo.setPassword(user.getPassword());
        passwordService.validate(userVo);
        return createLoginUser(userVo);
    }

    public UserDetails createLoginUser(UserVo userVo)
    {
        Set<String> perms = new HashSet<String>();
        perms.add("*:*:*");
        return new LoginUser(userVo.getUserId(), userVo.getDeptId(), userVo.getUserIdentity(), userVo, perms);
//        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
//        return new LoginUser(user.getUserId(), user.getDeptId(), user, perms);
    }
}
