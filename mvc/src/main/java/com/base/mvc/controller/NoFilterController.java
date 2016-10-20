/**
 * 
 */
package com.base.mvc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hp.tools.common.beans.EnumTypeRequestBean;
import com.hp.tools.common.beans.Response;
import com.hp.tools.common.utils.ObjectUtil;


/**
 * 描述：
 * 
 * @author ping.huang 2016年5月6日
 */
@Controller
@RequestMapping("/NoFilterController.do")
public class NoFilterController {

	static Logger log = LoggerFactory.getLogger(NoFilterController.class);


	/**
	 * 获取枚举的列表
	 * 
	 * @param bo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params = "method=getEnumForSelect")
	@ResponseBody
	public Response<JSONArray> getEnumForSelect(EnumTypeRequestBean bo) throws Exception {
		log.info("enter getEnumForSelect with EnumTypeRequestBO={}", bo);
		String className = bo.getClassName();
		if (className.indexOf(".") < 0) {
			className = "com.base.common.enums." + className;
		}
		JSONArray arr = (JSONArray) ObjectUtil.executeJavaMethod(Class.forName(className), "toJSON", null, null);
		if (bo.getFirstText() != null && bo.getFirstValue() != null) {
			JSONObject json = new JSONObject();
			json.put("text", bo.getFirstText());
			json.put("value", bo.getFirstValue());
			arr.add(0, json);
		}
		return new Response<JSONArray>(arr);
	}
}
