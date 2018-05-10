/**
 * 
 */
package com.base.dal.model;

import com.hp.core.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月6日 上午12:03:27
 */
public class BaseModel extends BaseBean {

	private static final long serialVersionUID = 6397691203861423315L;

	
	private String queryStartDate;
	private String queryEndDate;
	public String getQueryStartDate() {
		return queryStartDate;
	}
	public void setQueryStartDate(String queryStartDate) {
		this.queryStartDate = queryStartDate;
	}
	public String getQueryEndDate() {
		return queryEndDate;
	}
	public void setQueryEndDate(String queryEndDate) {
		this.queryEndDate = queryEndDate;
	}
}
