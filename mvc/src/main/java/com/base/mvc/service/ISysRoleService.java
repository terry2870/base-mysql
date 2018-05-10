/**
 * 
 */
package com.base.mvc.service;

import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageRequest;
import com.hp.core.common.beans.page.PageResponse;
import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;

/**
 * @author huangping
 * 2016年8月28日 下午4:04:46
 */
public interface ISysRoleService {

	
	/**
	 * 查询角色信息
	 * @param request
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public PageResponse<SysRoleResponseBO> queryAllSysRole(SysRoleRequestBO request, PageRequest pageRequest) throws Exception;
	
	/**
	 * 保存角色信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Response<?> saveSysRole(SysRoleRequestBO request) throws Exception;
	
	/**
	 * 删除角色信息
	 * @param roleId 需要删除的roleId
	 * @throws Exception
	 */
	public Response<?> deleteSysRole(int roleId) throws Exception;
}
