/**
 * 
 */
package com.base.dal.model;

import com.hp.core.common.beans.BaseBean;

/**
 * @author ping.huang
 * 2016年11月24日
 */
public class RegionInfos extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1505272602006718383L;

	private Integer provinceId;
	private String provinceName;
	
	private Integer cityId;
	private String cityName;
	
	private Integer countyId;
	private String countyName;
	
	private Integer townId;
	private String townName;
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public Integer getCountyId() {
		return countyId;
	}
	public void setCountyId(Integer countyId) {
		this.countyId = countyId;
	}
	public String getCountyName() {
		return countyName;
	}
	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}
	public Integer getTownId() {
		return townId;
	}
	public void setTownId(Integer townId) {
		this.townId = townId;
	}
	public String getTownName() {
		return townName;
	}
	public void setTownName(String townName) {
		this.townName = townName;
	}
	
}
