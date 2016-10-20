package com.base.dal.model;

import com.hp.tools.common.beans.BaseBean;

public class SysUserGroupUser extends BaseBean {
	private static final long serialVersionUID = 4711004313698258707L;

	private Integer userId;

	private Integer groupId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
}