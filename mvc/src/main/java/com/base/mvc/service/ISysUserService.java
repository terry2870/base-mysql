package com.base.mvc.service;

import com.hp.tools.common.beans.Response;
import com.hp.tools.common.beans.page.PageRequest;
import com.hp.tools.common.beans.page.PageResponse;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysUserResponseBO;

/**
 * 用户接口定义
 * @author huangping
 * 2014-03-11
 */
public interface ISysUserService {

	/**
	 * 登录
	 * @param request 用户对象
	 * @throws Exception
	 */
	public Response<SysUserResponseBO> login(SysUserRequestBO request) throws Exception;
	
	/**
	 * 保存用户信息
	 * @param request
	 * @param roleIds
	 * @return
	 * @throws Exception
	 */
	public Response<?> saveUser(SysUserRequestBO request, String roleIds) throws Exception;
	
	/**
	 * 删除用户信息
	 * @param userId 需要删除的用户id
	 * @throws Exception
	 */
	public Response<?> deleteUser(int userId) throws Exception;
	
	/**
	 * 修改密码
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 * @throws Exception
	 */
	public Response<?> modifyPwd(String oldPwd, String newPwd) throws Exception;
	
	/**
	 * 查询用户信息
	 * @param request
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public PageResponse<SysUserResponseBO> queryAllUser(SysUserRequestBO request, PageRequest pageRequest) throws Exception;
}

