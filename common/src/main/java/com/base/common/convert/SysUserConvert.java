/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.common.enums.IdentityEnum;
import com.base.dal.model.SysUser;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysUserResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysUserConvert {

	
	/**
	 * bo转为dal，request
	 * @param bo
	 * @return
	 */
	public static SysUser bo2DalRequest(SysUserRequestBO bo) {
		if (bo == null) {
			return null;
		}
		SysUser user = new SysUser();
		BeanUtils.copyProperties(bo, user);
		return user;
	}
	
	
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysUserResponseBO db2BOResponse(SysUser user) {
		if (user == null) {
			return null;
		}
		SysUserResponseBO bo = new SysUserResponseBO();
		BeanUtils.copyProperties(user, bo);
		bo.setIdentityStr(IdentityEnum.getNameByValue(bo.getIdentity()));
		return bo;
	}
}
