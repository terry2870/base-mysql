package com.base.dal.model;

import com.hp.core.common.beans.BaseBean;

public class SysUserActionLog extends BaseBean {
	private static final long serialVersionUID = 1786191546058666577L;

	private Integer logId;

	private Integer userId;

	private Byte logType;

	private String userIp;

	private Integer createTime;

	private String logClass;

	private String logInfo;

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Byte getLogType() {
		return logType;
	}

	public void setLogType(Byte logType) {
		this.logType = logType;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp == null ? null : userIp.trim();
	}

	public Integer getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	public String getLogClass() {
		return logClass;
	}

	public void setLogClass(String logClass) {
		this.logClass = logClass == null ? null : logClass.trim();
	}

	public String getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(String logInfo) {
		this.logInfo = logInfo == null ? null : logInfo.trim();
	}
}