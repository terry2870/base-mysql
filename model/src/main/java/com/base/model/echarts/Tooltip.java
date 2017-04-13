/**
 * 
 */
package com.base.model.echarts;

import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 上午12:12:39
 */
public class Tooltip extends BaseEChartsBean {

	private static final long serialVersionUID = 5924089686872791295L;

	private String trigger = "axis"; // 触发类型
	private boolean enterable; //鼠标是否可进入详情气泡中
	private String formatter;
	private AxisPointer axisPointer = new AxisPointer();
	/**
	 * 
	 */
	public Tooltip() {
	}
	
	public Tooltip(String trigger, String formatter) {
		this.trigger = trigger;
		this.formatter = formatter;
	}
	/**
	 * @param trigger
	 * @param enterable
	 */
	public Tooltip(String trigger, boolean enterable) {
		this.trigger = trigger;
		this.enterable = enterable;
	}
	
	public Tooltip(String trigger, AxisPointer axisPointer) {
		this.trigger = trigger;
		this.axisPointer = axisPointer;
	}
	
	public static class AxisPointer extends BaseBean {

		/**
		 * 
		 */
		private static final long serialVersionUID = -766159884168940108L;
		private String type = "line";
		
		public AxisPointer() {
		}
		
		public AxisPointer(String type) {
			this.type= type;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		
		
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
	public String getFormatter() {
		return formatter;
	}
	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public AxisPointer getAxisPointer() {
		return axisPointer;
	}

	public void setAxisPointer(AxisPointer axisPointer) {
		this.axisPointer = axisPointer;
	}	
}
