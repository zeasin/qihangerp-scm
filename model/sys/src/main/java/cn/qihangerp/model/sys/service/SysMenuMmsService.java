package cn.qihangerp.model.sys.service;

import cn.qihangerp.domain.vo.RouterVo;
import cn.qihangerp.model.sys.domain.SysMenuMms;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_menu(菜单权限表)】的数据库操作Service
* @createDate 2024-05-19 14:05:54
*/
public interface SysMenuMmsService extends IService<SysMenuMms> {
    List<SysMenuMms> selectMenuAll();
    List<RouterVo> buildMenus(List<SysMenuMms> menus);
}
