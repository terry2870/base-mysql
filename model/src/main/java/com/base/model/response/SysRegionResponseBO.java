package com.base.model.response;

public class SysRegionResponseBO extends BaseResponseBO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7711820812634070442L;

	private Integer regionId;

	private String regionName;

	private String regionCode;

	private Integer parentRegionId;

	private Integer sortNumber;

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
}