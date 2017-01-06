/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.dal.model.SysConfig;
import com.base.model.request.SysConfigRequestBO;
import com.base.model.response.SysConfigResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysConfigConvert {

	
	/**
	 * bo转为dal，request
	 * @param bo
	 * @return
	 */
	public static SysConfig bo2DalRequest(SysConfigRequestBO bo) {
		if (bo == null) {
			return null;
		}
		SysConfig user = new SysConfig();
		BeanUtils.copyProperties(bo, user);
		return user;
	}
	
	
	/**
	 * request转response
	 * @param request
	 * @return
	 */
	public static SysConfigResponseBO request2Response(SysConfigRequestBO request) {
		SysConfigResponseBO response = new SysConfigResponseBO();
		BeanUtils.copyProperties(request, response);
		return response;
	}
	
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysConfigResponseBO db2BOResponse(SysConfig user) {
		if (user == null) {
			return null;
		}
		SysConfigResponseBO bo = new SysConfigResponseBO();
		BeanUtils.copyProperties(user, bo);
		return bo;
	}
}
