package com.base.dal.model;

import com.hp.core.common.beans.BaseBean;

public class SysUserRegion extends BaseBean {
	private static final long serialVersionUID = 3683681053460760399L;

	private Integer userId;

	private Integer regionId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRegionId() {
		return regionId;
	}

	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}
}