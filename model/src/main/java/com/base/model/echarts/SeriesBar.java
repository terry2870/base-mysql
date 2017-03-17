/**
 * 
 */
package com.base.model.echarts;

/**
 * @author ping.huang
 * 2017年3月15日
 */
public class SeriesBar extends Series {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3252806130448916551L;

	private final String type = "bar";

	public SeriesBar(String name) {
		this.setName(name);
	}
	
	public String getType() {
		return type;
	}
}
