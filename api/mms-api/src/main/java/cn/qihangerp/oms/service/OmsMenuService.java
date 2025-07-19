package cn.qihangerp.oms.service;

import cn.qihangerp.domain.vo.RouterVo;
import cn.qihangerp.oms.domain.OmsMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【oms_menu(菜单权限表)】的数据库操作Service
* @createDate 2024-05-19 14:05:54
*/
public interface OmsMenuService extends IService<OmsMenu> {
    List<OmsMenu> selectMenuAll();
    List<RouterVo> buildMenus(List<OmsMenu> menus);
}
