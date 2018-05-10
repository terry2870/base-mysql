/**
 * 
 */
package com.base.model.echarts;

import com.hp.core.common.beans.BaseBean;

/**
 * @author ping.huang
 * 2017年3月15日
 */
public class TextStyle extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6506304579323586946L;

	
	private String color;
	private String align;
	private String baseline;
	private String fontStyle;
	private String fontWeight;
	private String fontFamily;
	private int fontSize;
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getBaseline() {
		return baseline;
	}
	public void setBaseline(String baseline) {
		this.baseline = baseline;
	}
	public String getFontStyle() {
		return fontStyle;
	}
	public void setFontStyle(String fontStyle) {
		this.fontStyle = fontStyle;
	}
	public String getFontWeight() {
		return fontWeight;
	}
	public void setFontWeight(String fontWeight) {
		this.fontWeight = fontWeight;
	}
	public String getFontFamily() {
		return fontFamily;
	}
	public void setFontFamily(String fontFamily) {
		this.fontFamily = fontFamily;
	}
	public int getFontSize() {
		return fontSize;
	}
	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}
}
