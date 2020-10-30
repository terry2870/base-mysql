/**
 * 
 */
package com.base.mvc.service;

import java.util.List;

import com.hp.core.common.beans.Response;
import com.base.model.response.SysRoleMenuResponseBO;

/**
 * @author huangping
 * 2016年9月11日 下午9:30:28
 */
public interface ISysRoleMenuService {

	/**
	 * 根据角色id，查询
	 * @param roleId
	 * @return
	 */
	List<SysRoleMenuResponseBO> selectByRoleId(Integer roleId);
	
	/**
	 * 根据菜单id，查询
	 * @param roleId
	 * @return
	 */
	List<SysRoleMenuResponseBO> selectByMenuId(Integer menuId);
	
	/**
	 * 批量插入角色菜单
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @
	 */
	Response<?> saveSysRoleMenu(Integer roleId, String menuIds);
}
