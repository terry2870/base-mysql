package com.base.dal;

import java.util.List;

import com.base.dal.model.SysRoleMenu;

public interface ISysRoleMenuDAO {
	int insert(SysRoleMenu record);
	
	/**
	 * 根据角色id，查询
	 * @param roleId
	 * @return
	 */
	List<SysRoleMenu> selectByRoleId(Integer roleId);
	
	/**
	 * 根据菜单id，查询
	 * @param roleId
	 * @return
	 */
	List<SysRoleMenu> selectByMenuId(Integer menuId);
	
	/**
	 * 删除该角色下所有菜单
	 * @param roleId
	 * @return
	 */
	int deleteByRoleId(Integer roleId);
	
	/**
	 * 批量插入角色菜单
	 * @param list
	 * @return
	 */
	int insertBatch(List<SysRoleMenu> list);
	
	/**
	 * 查询该用户的菜单
	 * @param userId
	 * @return
	 */
	List<Integer> selectByUserId(Integer userId);
}