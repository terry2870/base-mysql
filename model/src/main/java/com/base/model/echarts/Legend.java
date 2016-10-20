/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.List;

/**
 * @author huangping
 * 2016年9月28日 上午12:13:10
 */
public class Legend extends BaseEChartsBean {

	private static final long serialVersionUID = 8890512241296245344L;
	
	private String x = "center";
	private List<String> data = new ArrayList<>();

	/**
	 * 
	 */
	public Legend() {
	}

	/**
	 * @param data
	 */
	public Legend(List<String> data) {
		this.data = data;
	}

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}
	
}
