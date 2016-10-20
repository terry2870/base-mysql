/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.dal.model.SysUserRole;
import com.base.model.response.SysUserRoleResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysUserRoleConvert {
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysUserRoleResponseBO db2BOResponse(SysUserRole role) {
		if (role == null) {
			return null;
		}
		SysUserRoleResponseBO bo = new SysUserRoleResponseBO();
		BeanUtils.copyProperties(role, bo);
		return bo;
	}
}
