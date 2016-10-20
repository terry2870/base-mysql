/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.dal.model.SysRoleMenu;
import com.base.model.response.SysRoleMenuResponseBO;

/**
 * @author huangping
 * 2016年9月11日 下午9:38:48
 */
public class SysRoleMenuConvert {

	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysRoleMenuResponseBO db2BOResponse(SysRoleMenu roleMenu) {
		if (roleMenu == null) {
			return null;
		}
		SysRoleMenuResponseBO bo = new SysRoleMenuResponseBO();
		BeanUtils.copyProperties(roleMenu, bo);
		return bo;
	}
}
