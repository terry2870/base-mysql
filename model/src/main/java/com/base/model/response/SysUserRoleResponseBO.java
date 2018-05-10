/**
 * 
 */
package com.base.model.response;

import com.hp.core.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年8月28日 下午4:22:33
 */
public class SysUserRoleResponseBO extends BaseBean {

	private static final long serialVersionUID = -3696167558571404651L;

	private Integer userId;
	private Integer roleId;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}
