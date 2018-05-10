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
	 * @throws Exception
	 */
	List<SysUserRoleResponseBO> selectByUserId(int userId) throws Exception;
	
	/**
	 * 插入用户的角色关系
	 * @param userId
	 * @param roleIds
	 * @return
	 * @throws Exception
	 */
	Response<?> insertUserRole(int userId, String roleIds) throws Exception;
}
