package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dal.model.SysMenu;

public interface ISysMenuDAO {
	int deleteByPrimaryKey(Integer menuId);

	int insert(SysMenu record);

	SysMenu selectByPrimaryKey(Integer menuId);

	int updateByPrimaryKeySelective(SysMenu record);

	int updateByPrimaryKey(SysMenu record);
	
	/**
	 * 递归向上，查找所有菜单
	 * @param menuIds
	 * @return
	 */
	List<SysMenu> selectSysMenu(String menuIds);
	
	/**
	 * 查询所有菜单
	 * @return
	 */
	List<SysMenu> selectAllSysMenu();
	
	SysMenu selectByMenuNameAndPid(@Param("menuName") String menuName, @Param("parentMenuId") int parentMenuId);
}