/**
 * 
 */
package com.base.mvc.service;

import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;
import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageResponse;
import com.hp.core.database.bean.PageRequest;

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
	 */
	public PageResponse<SysRoleResponseBO> queryAllSysRole(SysRoleRequestBO request, PageRequest pageRequest);
	
	/**
	 * 保存角色信息
	 * @param request
	 * @return
	 */
	public Response<?> saveSysRole(SysRoleRequestBO request);
	
	/**
	 * 删除角色信息
	 * @param roleId 需要删除的roleId
	 */
	public Response<?> deleteSysRole(int roleId);
}
