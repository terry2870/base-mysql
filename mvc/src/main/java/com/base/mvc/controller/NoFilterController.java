/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysConfigResponseBO;
import com.base.model.response.SysUserResponseBO;
import com.base.mvc.service.ISysConfigService;
import com.base.mvc.service.ISysUserService;
import com.hp.core.common.beans.EnumTypeRequestBean;
import com.hp.core.common.beans.Response;
import com.hp.core.common.utils.ObjectUtil;


/**
 * 描述：
 * 
 * @author ping.huang 2016年5月6日
 */
@RestController
@RequestMapping("/NoFilterController.do")
public class NoFilterController {

	static Logger log = LoggerFactory.getLogger(NoFilterController.class);
	
	@Autowired
	private ISysConfigService sysConfigService;
	@Autowired
	private ISysUserService sysUserService;


	/**
	 * 获取枚举的列表
	 * 
	 * @param bo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(params = "method=getEnumForSelect")
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
	
	/**
	 * 根据配置key，获取值
	 * @param key
	 * @return
	 */
	@RequestMapping(params = "method=getConfigByKey")
	public Response<SysConfigResponseBO> getConfigByKey(String key) {
		log.info("enter getConfigValueByKey with key={}", key);
		SysConfigResponseBO config = sysConfigService.getSysConfigByKey(key);
		log.info("getConfigValueByKey success. with key={}, result={}", key, config);
		return new Response<>(config);
	}
	
	/**
	 * 根据条件，查询用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "method=getUserList")
	public Response<List<SysUserResponseBO>> getUserList(SysUserRequestBO request) {
		log.info("enter getUserList with request={}", request);
		List<SysUserResponseBO> list = sysUserService.queryAll(request);
		if (CollectionUtils.isEmpty(list)) {
			log.warn("getUserList result is empty. with request={}", request);
			return new Response<>(new ArrayList<>());
		}
		log.info("getUserList success. with request={}", request);
		return new Response<>(list);
	}

}
