/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.List;

import com.google.common.collect.Lists;
import com.hp.tools.common.beans.BaseBean;
import com.base.model.echarts.Axis.AxisLabel;

/**
 * @author huangping 2016年9月27日 下午11:44:53
 */
public class EChartsResponseBO extends BaseBean {

	private static final long serialVersionUID = -7524336888849955306L;

	public static void main(String[] args) {
		EChartsResponseBO bo = new EChartsResponseBO();
		bo.setTitle(new Title("温度变化", "试试看啊"));
		//bo.setTooltip(new Tooltip());
		bo.setLegend(new Legend(Lists.newArrayList("最高气温", "最低气温")));
		bo.setxAxis(Lists.newArrayList(new Axis("category", Lists.newArrayList("周一", "周二", "周三", "周四", "周五", "周六", "周日"))));
		bo.setyAxis(Lists.newArrayList(new Axis("value", new AxisLabel("{value} °C"))));
		
		bo.setSeries(Lists.newArrayList(new Series("line", "最高气温", Lists.newArrayList(11, 11, 15, 13, 12, 13, 10)), new Series("line", "最低气温", Lists.newArrayList(1, -2, 2, 5, 3, 2, 0))));
		System.out.println(bo.toString());
	}
	
	
	private Title title = new Title();
	private Tooltip tooltip = new Tooltip();
	private Legend legend = new Legend();
	private Toolbox toolbox = new Toolbox();
	private List<Axis> xAxis = new ArrayList<>();
	private List<Axis> yAxis = new ArrayList<>();
	private List<Series> series = new ArrayList<>();
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public Tooltip getTooltip() {
		return tooltip;
	}
	public void setTooltip(Tooltip tooltip) {
		this.tooltip = tooltip;
	}
	public Legend getLegend() {
		return legend;
	}
	public void setLegend(Legend legend) {
		this.legend = legend;
	}
	public Toolbox getToolbox() {
		return toolbox;
	}
	public void setToolbox(Toolbox toolbox) {
		this.toolbox = toolbox;
	}
	public List<Axis> getxAxis() {
		return xAxis;
	}
	public void setxAxis(List<Axis> xAxis) {
		this.xAxis = xAxis;
	}
	public List<Axis> getyAxis() {
		return yAxis;
	}
	public void setyAxis(List<Axis> yAxis) {
		this.yAxis = yAxis;
	}
	public List<Series> getSeries() {
		return series;
	}
	public void setSeries(List<Series> series) {
		this.series = series;
	}
	

}
