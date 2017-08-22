/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.lang3.ArrayUtils;

import com.google.common.collect.Lists;
import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 下午11:52:46
 */
public abstract class Series extends BaseEChartsBean {

	private static final long serialVersionUID = -5276016747421148921L;

	
	private String name;
	private Collection<SeriesData> data = new ArrayList<>();
	private MarkPoint markPoint = new MarkPoint();
	private MarkLine markLine = new MarkLine();
	

	
	public Series() {
	}
	
	public Series(Collection<SeriesData> data) {
		this.data = data;
	}
	public Series(Object... data) {
		setData(data);
	}
	public Series(Collection<SeriesData> data, MarkPoint markPoint, MarkLine markLine) {
		this(data);
		this.markPoint = markPoint;
		this.markLine = markLine;
	}


	public static class MarkPoint extends BaseBean {

		private static final long serialVersionUID = -625196395506883418L;
		
		private Collection<SeriesData> data = Lists.newArrayList(new SeriesData("最小值", "min"), new SeriesData("最大值", "max"));
		/**
		 * 
		 */
		public MarkPoint() {
		}
		/**
		 * @param clickable
		 * @param data
		 */
		public MarkPoint(Collection<SeriesData> data) {
			this.data = data;
		}
		public Collection<SeriesData> getData() {
			return data;
		}
		public void setData(Collection<SeriesData> data) {
			this.data = data;
		}
	}
	
	public static class MarkLine extends BaseBean {

		private static final long serialVersionUID = 1532640048492471819L;
		
		private Collection<SeriesData> data = Lists.newArrayList(new SeriesData("平均值", "average"));
		/**
		 * 
		 */
		public MarkLine() {
		}

		public MarkLine(Collection<SeriesData> data) {
			this.data = data;
		}

		public Collection<SeriesData> getData() {
			return data;
		}
		public void setData(Collection<SeriesData> data) {
			this.data = data;
		}
	}
	
	public static class SeriesData extends BaseBean {

		private static final long serialVersionUID = 2096300328478104303L;
		
		private String type;
		private String name;
		private Object value;
		private Object extraData;
		/**
		 * 
		 */
		public SeriesData() {
		}
		public SeriesData(Object value) {
			this.value = value;
		}
		public SeriesData(Object value, String name) {
			this(value);
			this.name = name;
		}
		public SeriesData(String name, String type) {
			this.name = name;
			this.type = type;
		}
		public SeriesData(Object value, String name, String type) {
			this(value, name);
			this.type = type;
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
		public Object getValue() {
			return value;
		}
		public void setValue(Object value) {
			this.value = value;
		}
		public Object getExtraData() {
			return extraData;
		}
		public void setExtraData(Object extraData) {
			this.extraData = extraData;
		}
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<SeriesData> getData() {
		return data;
	}

	public void setData(Collection<SeriesData> data) {
		this.data = data;
	}
	
	public Series addData(SeriesData... data) {
		if (ArrayUtils.isNotEmpty(data)) {
			for (SeriesData obj : data) {
				this.data.add(obj);
			}
		}
		return this;
	}
	
	public Series addData(Object... data) {
		if (ArrayUtils.isNotEmpty(data)) {
			for (Object obj : data) {
				this.data.add(new SeriesData(obj));
			}
		}
		return this;
	}
	public Series setData(Object... data) {
		this.data.clear();
		return addData(data);
	}

	public MarkPoint getMarkPoint() {
		return markPoint;
	}

	public Series setMarkPoint(MarkPoint markPoint) {
		this.markPoint = markPoint;
		return this;
	}

	public MarkLine getMarkLine() {
		return markLine;
	}

	public Series setMarkLine(MarkLine markLine) {
		this.markLine = markLine;
		return this;
	}
}
