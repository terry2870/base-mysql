/**
 * 
 */
package com.base.model.response;

/**
 * @author huangping
 * 2016年8月23日 下午11:14:45
 */
public class SysUserResponseBO extends BaseResponseBO {

	
	private static final long serialVersionUID = 9088967830404435092L;

	private Integer userId;

	private String userName;

	private String loginName;

	private String loginPwd;

	private String mobile;

	private String phoneNumber;

	private String address;

	private String email;

	private Integer lastLoginTime;
		
	private Byte identity;
	
	private String identityStr;
	
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
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Integer lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Byte getIdentity() {
		return identity;
	}

	public void setIdentity(Byte identity) {
		this.identity = identity;
	}

	public String getIdentityStr() {
		return identityStr;
	}

	public void setIdentityStr(String identityStr) {
		this.identityStr = identityStr;
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
