package com.base.model.request;

import com.hp.core.common.beans.BaseBean;

public class SysRegionRequestBO extends BaseBean {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7711820812634070442L;

	private Integer regionId;

	private String regionName;

	private String regionCode;

	private Integer parentRegionId;

	private Integer sortNumber;
	
	private Byte status;

	public Integer getRegionId() {
		return regionId;
	}

	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName == null ? null : regionName.trim();
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode == null ? null : regionCode.trim();
	}

	public Integer getParentRegionId() {
		return parentRegionId;
	}

	public void setParentRegionId(Integer parentRegionId) {
		this.parentRegionId = parentRegionId;
	}

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}
}