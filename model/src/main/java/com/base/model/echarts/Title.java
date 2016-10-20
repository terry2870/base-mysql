/**
 * 
 */
package com.base.model.echarts;

/**
 * @author huangping
 * 2016年9月28日 上午12:11:50
 */
public class Title extends BaseEChartsBean {

	private static final long serialVersionUID = -1007463830545765654L;

	private String x = "left";
	private String text; // 主标题
	private String subtext; // 副标题

	/**
	 * 
	 */
	public Title() {
	}

	/**
	 * @param text
	 * @param subtext
	 */
	public Title(String text, String subtext) {
		this.text = text;
		this.subtext = subtext;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSubtext() {
		return subtext;
	}

	public void setSubtext(String subtext) {
		this.subtext = subtext;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}
}
