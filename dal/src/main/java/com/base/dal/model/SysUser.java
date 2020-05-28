package com.base.dal.model;

import com.hp.core.common.beans.BaseBean;

public class SysUser extends BaseBean {
	private static final long serialVersionUID = -6079671205083041356L;

	private Integer userId;

	private String userName;

	private String loginName;

	private String loginPwd;

	private String mobile;

	private String phoneNumber;

	private String address;

	private String email;

	private Byte status;

	private Integer createUserId;

	private Integer lastLoginTime;

	private Integer createTime;

	private Integer updateTime;
	
	private String identitys;
	private Byte identity;
	
	private Integer salaryStatic;
	private String cardNumber;
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName == null ? null : loginName.trim();
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd == null ? null : loginPwd.trim();
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Integer getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Integer lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	public Integer getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Integer updateTime) {
		this.updateTime = updateTime;
	}

	public Byte getIdentity() {
		return identity;
	}

	public void setIdentity(Byte identity) {
		this.identity = identity;
	}

	public String getIdentitys() {
		return identitys;
	}

	public void setIdentitys(String identitys) {
		this.identitys = identitys;
	}

	public Integer getSalaryStatic() {
		return salaryStatic;
	}

	public void setSalaryStatic(Integer salaryStatic) {
		this.salaryStatic = salaryStatic;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
}