/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.lang3.ArrayUtils;

/**
 * @author huangping
 * 2016年9月28日 上午12:13:10
 */
public class Legend extends BaseEChartsBean {

	private static final long serialVersionUID = 8890512241296245344L;
	
	private String x = "center";
	private Collection<String> data = new ArrayList<>();

	/**
	 * 
	 */
	public Legend() {
	}

	public Legend(String... data) {
		if (ArrayUtils.isNotEmpty(data)) {
			for (String str : data) {
				this.data.add(str);
			}
		}
	}

	
	/**
	 * @param data
	 */
	public Legend(Collection<String> data) {
		this.data = data;
	}

	public Collection<String> getData() {
		return data;
	}

	public void setData(Collection<String> data) {
		this.data = data;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}
	
}
