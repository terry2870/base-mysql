/**
 * 
 */
package com.base.model.echarts;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.lang3.ArrayUtils;

import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 下午11:40:32
 */
public class Axis extends BaseEChartsBean {

	private static final long serialVersionUID = 8891341876143427070L;

	private String type;
	private Collection<AxisData> data = new ArrayList<>();
	private AxisLabel axisLabel = new AxisLabel();
	/**
	 * 
	 */
	public Axis() {
	}
	
	/**
	 * @param data
	 */
	public Axis(Collection<AxisData> data) {
		this.data = data;
	}
	
	public Axis(Object... data) {
		this.data.clear();
		addData(data);
	}

	public Axis(String type) {
		this.type = type;
	}
	
	public Axis(String type, AxisLabel axisLabel) {
		this.type = type;
		this.axisLabel = axisLabel;
	}

	public Axis(String type, Collection<AxisData> data) {
		this.type = type;
		this.data = data;
	}

	public Axis(String type, Collection<AxisData> data, AxisLabel axisLabel) {
		this.type = type;
		this.data = data;
		this.axisLabel = axisLabel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Collection<AxisData> getData() {
		return data;
	}

	public Axis setData(Collection<AxisData> data) {
		this.data = data;
		return this;
	}
	
	public Axis setData(AxisData... data) {
		this.data.clear();
		return addData(data);
	}
	public Axis setData(Object... data) {
		this.data.clear();
		return addData(data);
	}
	
	public Axis addData(AxisData... data) {
		if (ArrayUtils.isNotEmpty(data)) {
			for (AxisData d : data) {
				this.data.add(d);
			}
		}
		return this;
	}
	
	public Axis addData(Object... data) {
		if (ArrayUtils.isNotEmpty(data)) {
			for (Object str : data) {
				this.data.add(new AxisData(str));
			}
		}
		return this;
	}
	
	public static class AxisData extends BaseBean {

		/**
		 * 
		 */
		private static final long serialVersionUID = -898364132883527938L;

		private Object value;
		private String name;
		private TextStyle textStyle;
		
		public AxisData() {
		}
		
		public AxisData(Object value) {
			this.value = value;
		}
		
		public AxisData(Object value, String name) {
			this(value);
			this.name = name;
		}
		

		public AxisData(Object value, String name, TextStyle textStyle) {
			this(value, name);
			this.textStyle = textStyle;
		}
		public Object getValue() {
			return value;
		}
		public void setValue(Object value) {
			this.value = value;
		}
		public TextStyle getTextStyle() {
			return textStyle;
		}
		public void setTextStyle(TextStyle textStyle) {
			this.textStyle = textStyle;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}
	
	public static class AxisLabel extends BaseBean {

		private static final long serialVersionUID = -4161983049507792533L;
		
		private boolean clickable;
		private String formatter;
		/**
		 * 
		 */
		public AxisLabel() {
		}
		/**
		 * @param formatter
		 */
		public AxisLabel(String formatter) {
			this.formatter = formatter;
		}
		/**
		 * @param clickable
		 * @param formatter
		 */
		public AxisLabel(boolean clickable, String formatter) {
			this.clickable = clickable;
			this.formatter = formatter;
		}
		public boolean isClickable() {
			return clickable;
		}
		public void setClickable(boolean clickable) {
			this.clickable = clickable;
		}
		public String getFormatter() {
			return formatter;
		}
		public void setFormatter(String formatter) {
			this.formatter = formatter;
		}
		
	}

	public AxisLabel getAxisLabel() {
		return axisLabel;
	}
	public void setAxisLabel(AxisLabel axisLabel) {
		this.axisLabel = axisLabel;
	}
}
