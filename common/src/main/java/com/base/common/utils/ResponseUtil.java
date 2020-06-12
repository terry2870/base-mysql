/**
 * 
 */
package com.base.common.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hp.core.common.beans.Response;
import com.hp.core.common.enums.StatusEnum;
import com.hp.core.common.utils.DateUtil;
import com.base.common.enums.CodeEnum;

/**
 * @author huangping
 * 2016年8月24日 下午11:41:15
 */
public class ResponseUtil {

	static Logger log = LoggerFactory.getLogger(ResponseUtil.class);
	
	/**
	 * 是否成功
	 * @param response
	 * @return
	 */
	public static boolean success(Response<?> response) {
		return response != null && response.getCode() == CodeEnum.SUCCESS.getCode();
	}
	
	/**
	 * 新增时，设置初始值
	 * @param obj
	 */
	public static void setAddBaseData(Object obj) {
		if (obj == null) {
			return;
		}
		try {
			int now = DateUtil.getCurrentTimeSeconds();
			BeanUtils.setProperty(obj, "createTime", now);
			BeanUtils.setProperty(obj, "updateTime", now);
			BeanUtils.setProperty(obj, "createUserId", SessionUtil.getSessionUser() == null ? 0 : SessionUtil.getSessionUser().getUserId());
			if (BeanUtils.getProperty(obj, "status") == null) {
				BeanUtils.setProperty(obj, "status", StatusEnum.OPEN.getValue());
			}
		} catch (Exception e) {
			//log.info("setAddBaseData error with obj={}", obj, e);
		}
	}
	
	/**
	 * 修改时，设置初始值
	 * @param obj
	 */
	public static void setUpdateBaseData(Object obj) {
		if (obj == null) {
			return;
		}
		try {
			int now = DateUtil.getCurrentTimeSeconds();
			BeanUtils.setProperty(obj, "updateTime", now);
		} catch (Exception e) {
			//log.info("setAddBaseData error with obj={}", obj, e);
		}
	}
}
