package com.base.common.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 操作日志类型枚举类
 * @author huangping<br />
 * 2014-03-11
 */
public enum ActionTypeEnum {

	/**
	 * 登录
	 */
	LOGIN(1, "登录"),
	
	/**
	 * 查询
	 */
	SEARCH(2, "查询"),
	
	/**
	 * 新增
	 */
	ADD(3, "新增"),
	
	/**
	 * 修改
	 */
	MODIFY(4, "修改"),
	
	/**
	 * 删除
	 */
	DELETE(5, "删除");
	
	private ActionTypeEnum(int value, String name) {
		this.value = value;
		this.name = name;
	}

	private int value;
	private String name;

	public int getValue() {
		return value;
	}
	
	public String getName() {
		return this.name;
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
}

