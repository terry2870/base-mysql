/**
 * 
 */
package com.base.model.echarts;

/**
 * @author huangping
 * 2016年9月28日 上午12:12:39
 */
public class Tooltip extends BaseEChartsBean {

	private static final long serialVersionUID = 5924089686872791295L;

	private String trigger = "axis"; // 触发类型
	private boolean enterable; //鼠标是否可进入详情气泡中
	/**
	 * 
	 */
	public Tooltip() {
	}
	/**
	 * @param trigger
	 * @param enterable
	 */
	public Tooltip(String trigger, boolean enterable) {
		this.trigger = trigger;
		this.enterable = enterable;
	}
	public String getTrigger() {
		return trigger;
	}
	public void setTrigger(String trigger) {
		this.trigger = trigger;
	}
	public boolean isEnterable() {
		return enterable;
	}
	public void setEnterable(boolean enterable) {
		this.enterable = enterable;
	}	
}
