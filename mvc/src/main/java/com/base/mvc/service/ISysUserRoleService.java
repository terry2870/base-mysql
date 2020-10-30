/**
 * 
 */
package com.base.mvc.service;

import java.util.List;

import com.hp.core.common.beans.Response;
import com.base.model.response.SysUserRoleResponseBO;

/**
 * @author huangping
 * 2016年8月28日 下午4:23:37
 */
public interface ISysUserRoleService {

	/**
	 * 查询该用户的角色
	 * @param userId
	 * @return
	 */
	List<SysUserRoleResponseBO> selectByUserId(int userId);
	
	/**
	 * 插入用户的角色关系
	 * @param userId
	 * @param roleIds
	 * @return
	 */
	Response<?> insertUserRole(int userId, String roleIds);
}
