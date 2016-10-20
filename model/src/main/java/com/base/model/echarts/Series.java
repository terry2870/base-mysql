/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.List;

import com.google.common.collect.Lists;
import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 下午11:52:46
 */
public class Series extends BaseEChartsBean {

	private static final long serialVersionUID = -5276016747421148921L;

	private String type;
	private String name;
	private List<Object> data = new ArrayList<>();
	private MarkPoint markPoint = new MarkPoint();
	private MarkLine markLine = new MarkLine();
	
	private int xAxisIndex;
	private int yAxisIndex;
	private String barGap = "30%";
	private String barCategoryGap = "20%";
	private int barMinHeight;
	
	public Series() {
	}

	/**
	 * @param type
	 * @param name
	 * @param data
	 * @param markPoint
	 * @param markLine
	 */
	public Series(String type, String name, List<Object> data, MarkPoint markPoint, MarkLine markLine) {
		this.type = type;
		this.name = name;
		this.data = data;
		this.markPoint = markPoint;
		this.markLine = markLine;
	}

	/**
	 * @param type
	 * @param name
	 * @param data
	 */
	public Series(String type, String name, List<Object> data) {
		this.type = type;
		this.name = name;
		this.data = data;
	}

	public static class MarkPoint extends BaseBean {

		private static final long serialVersionUID = -625196395506883418L;
		
		private boolean clickable = true;
		private List<Data> data = Lists.newArrayList(new Data("min", "最小值"), new Data("max", "最大值"));
		/**
		 * 
		 */
		public MarkPoint() {
		}
		/**
		 * @param clickable
		 * @param data
		 */
		public MarkPoint(boolean clickable, List<Data> data) {
			this.clickable = clickable;
			this.data = data;
		}
		public boolean isClickable() {
			return clickable;
		}
		public void setClickable(boolean clickable) {
			this.clickable = clickable;
		}
		public List<Data> getData() {
			return data;
		}
		public void setData(List<Data> data) {
			this.data = data;
		}
	}
	
	public static class MarkLine extends BaseBean {

		private static final long serialVersionUID = 1532640048492471819L;
		
		private boolean clickable = true;
		private List<Data> data = Lists.newArrayList(new Data("average", "平均值"));
		/**
		 * 
		 */
		public MarkLine() {
		}
		/**
		 * @param clickable
		 * @param data
		 */
		public MarkLine(boolean clickable, List<Data> data) {
			this.clickable = clickable;
			this.data = data;
		}
		public boolean isClickable() {
			return clickable;
		}
		public void setClickable(boolean clickable) {
			this.clickable = clickable;
		}
		public List<Data> getData() {
			return data;
		}
		public void setData(List<Data> data) {
			this.data = data;
		}
	}
	
	public static class Data extends BaseBean {

		private static final long serialVersionUID = 2096300328478104303L;
		
		private String type;
		private String name;
		/**
		 * 
		 */
		public Data() {
		}
		/**
		 * @param type
		 * @param name
		 */
		public Data(String type, String name) {
			this.type = type;
			this.name = name;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}

	public MarkPoint getMarkPoint() {
		return markPoint;
	}

	public void setMarkPoint(MarkPoint markPoint) {
		this.markPoint = markPoint;
	}

	public MarkLine getMarkLine() {
		return markLine;
	}

	public void setMarkLine(MarkLine markLine) {
		this.markLine = markLine;
	}

	public int getxAxisIndex() {
		return xAxisIndex;
	}

	public void setxAxisIndex(int xAxisIndex) {
		this.xAxisIndex = xAxisIndex;
	}

	public int getyAxisIndex() {
		return yAxisIndex;
	}

	public void setyAxisIndex(int yAxisIndex) {
		this.yAxisIndex = yAxisIndex;
	}

	public String getBarGap() {
		return barGap;
	}

	public void setBarGap(String barGap) {
		this.barGap = barGap;
	}

	public String getBarCategoryGap() {
		return barCategoryGap;
	}

	public void setBarCategoryGap(String barCategoryGap) {
		this.barCategoryGap = barCategoryGap;
	}

	public int getBarMinHeight() {
		return barMinHeight;
	}

	public void setBarMinHeight(int barMinHeight) {
		this.barMinHeight = barMinHeight;
	}
}
