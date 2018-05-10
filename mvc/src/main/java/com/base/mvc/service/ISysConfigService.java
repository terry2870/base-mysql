package com.base.mvc.service;

import com.base.model.request.SysConfigRequestBO;
import com.base.model.response.SysConfigResponseBO;
import com.hp.core.common.beans.Response;

/**
 * 用户接口定义
 * @author huangping
 * 2014-03-11
 */
public interface ISysConfigService {
	
	/**
	 * 根据key获取值
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public SysConfigResponseBO getSysConfigByKey(String key) throws Exception;
	
	/**
	 * 根据key，更新value
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Response<?> updateByConfigKey(SysConfigRequestBO request) throws Exception;
	
}

