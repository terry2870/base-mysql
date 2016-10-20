/**
 * 
 */
package com.base.model.echarts;

import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 上午12:07:32
 */
public class BaseEChartsBean extends BaseBean {

	private static final long serialVersionUID = 1415897272988024287L;

	private boolean show = true; //是否显示
	private int zlevel = 0; // 一级层叠控制
	private int z = 6; // 二级层叠控制
	private String orient = "horizontal";
	private String x = "right"; //水平安放位置
	private String y = "top"; //垂直安放位置
	public boolean isShow() {
		return show;
	}
	public void setShow(boolean show) {
		this.show = show;
	}
	public int getZlevel() {
		return zlevel;
	}
	public void setZlevel(int zlevel) {
		this.zlevel = zlevel;
	}
	public int getZ() {
		return z;
	}
	public void setZ(int z) {
		this.z = z;
	}
	public String getOrient() {
		return orient;
	}
	public void setOrient(String orient) {
		this.orient = orient;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
}
