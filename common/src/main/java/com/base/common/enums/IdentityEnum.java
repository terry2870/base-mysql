/**
 * 
 */
package com.base.common.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @author huangping
 * 2016年8月30日 上午12:17:41
 */
public enum IdentityEnum {
	
	
	SUPERUSER(1, "超级管理员"),
	MANAGER(2, "普通管理员"),
	NORMAL(3, "普通员工");
	

	private IdentityEnum(int value, String name) {
		this.value = value;
		this.name = name;
	}

	private int value;
	private String name;

	public int getValue() {
		return value;
	}

	public String getName() {
		return name;
	}

	/**
	 * 返回json格式的数据
	 * @return 返回json格式的数据
	 */
	public static JSONArray toJSON() {
		JSONArray arr = new JSONArray();
		JSONObject json = null;
		for (int i = 0; i < values().length; i++) {
			json = new JSONObject();
			json.put("text", values()[i].getName());
			json.put("value", values()[i].getValue());
			arr.add(json);
		}
		return arr;
	}
	
	public static String getNameByValue(int value) {
		for (IdentityEnum e : values()) {
			if (value == e.getValue()) {
				return e.getName();
			}
		}
		return null;
	}
}
