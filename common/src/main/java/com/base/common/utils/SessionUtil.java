/**
 * 
 */
package com.base.common.utils;

import com.base.common.interceptor.UrlInterceptor;
import com.base.model.OperaBean;
import com.base.model.response.SysUserResponseBO;

/**
 * @author huangping
 * 2016年8月24日 下午10:58:41
 */
public class SessionUtil {

	/**
	 * 判断当前用户是否是超级管理员
	 * @return
	 */
	public static boolean isSuperUser() {
		return getOperater().isSuperUser();
	}
	
	/**
	 * 获取当前操作者信息
	 * @return
	 */
	public static OperaBean getOperater() {
		return UrlInterceptor.getOperater();
	}
	
	/**
	 * 获取当前用户
	 * @return
	 */
	public static SysUserResponseBO getSessionUser() {
		return getOperater().getUser();
	}
}
