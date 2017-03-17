/**
 * 
 */
package com.base.model.echarts;

/**
 * @author ping.huang
 * 2017年3月15日
 */
public class SeriesPie extends Series {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4976335106381858358L;

	private final String type = "pie";
	private String radius;
	private String[] center = { "50%", "50%" };
	
	public SeriesPie(String name) {
		super(name);
	}
	
	public SeriesPie(String name, String radius) {
		this(name);
		this.radius = radius;
	}
	
	public SeriesPie(String name, String radius, String[] center) {
		this(name, radius);
		this.center = center;
	}
	
	public String getRadius() {
		return radius;
	}
	public void setRadius(String radius) {
		this.radius = radius;
	}
	public String[] getCenter() {
		return center;
	}
	public void setCenter(String[] center) {
		this.center = center;
	}
	public String getType() {
		return type;
	}
	
}
