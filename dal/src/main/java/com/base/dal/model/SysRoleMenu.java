package com.base.dal.model;

import com.hp.tools.common.beans.BaseBean;

public class SysRoleMenu extends BaseBean {
	private static final long serialVersionUID = -2910964482055620993L;

	private Integer roleId;

	private Integer menuId;

	/**
	 * @param roleId
	 * @param menuId
	 */
	public SysRoleMenu(Integer roleId, Integer menuId) {
		super();
		this.roleId = roleId;
		this.menuId = menuId;
	}

	/**
	 * 
	 */
	public SysRoleMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
}