/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.dal.model.SysRole;
import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysRoleConvert {

	
	/**
	 * bo转为dal，request
	 * @param bo
	 * @return
	 */
	public static SysRole bo2DalRequest(SysRoleRequestBO bo) {
		if (bo == null) {
			return null;
		}
		SysRole role = new SysRole();
		BeanUtils.copyProperties(bo, role);
		return role;
	}
	
	
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysRoleResponseBO db2BOResponse(SysRole role) {
		if (role == null) {
			return null;
		}
		SysRoleResponseBO bo = new SysRoleResponseBO();
		BeanUtils.copyProperties(role, bo);
		return bo;
	}
}
