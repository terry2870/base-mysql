package com.base.model.response;

import com.hp.core.common.beans.BaseResponseBO;

public class SysRoleResponseBO extends BaseResponseBO {
	private static final long serialVersionUID = -1812874514783322491L;

	private Integer roleId;

	private String roleName;

	private String roleInfo;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName == null ? null : roleName.trim();
	}

	public String getRoleInfo() {
		return roleInfo;
	}

	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo == null ? null : roleInfo.trim();
	}
}