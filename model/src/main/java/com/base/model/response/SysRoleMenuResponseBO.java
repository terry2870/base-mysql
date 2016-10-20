package com.base.model.response;

import com.hp.tools.common.beans.BaseBean;

public class SysRoleMenuResponseBO extends BaseBean {
	private static final long serialVersionUID = -2910964482055620993L;

	private Integer roleId;

	private Integer menuId;

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