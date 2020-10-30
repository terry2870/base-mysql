package com.base.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysUserResponseBO;
import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageResponse;
import com.hp.core.database.bean.PageRequest;

/**
 * 用户接口定义
 * @author huangping
 * 2014-03-11
 */
public interface ISysUserService {

	/**
	 * 登录
	 * @param request 用户对象
	 */
	public Response<SysUserResponseBO> login(SysUserRequestBO request);
	
	/**
	 * 保存用户信息
	 * @param request
	 * @param roleIds
	 * @return
	 */
	public Response<?> saveUser(SysUserRequestBO request, String roleIds);
	
	/**
	 * 删除用户信息
	 * @param userId 需要删除的用户id
	 */
	public Response<?> deleteUser(int userId);
	
	/**
	 * 修改密码
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	public Response<?> modifyPwd(String oldPwd, String newPwd);
	
	/**
	 * 查询用户信息
	 * @param request
	 * @param pageRequest
	 * @return
	 */
	public PageResponse<SysUserResponseBO> queryAllUser(SysUserRequestBO request, PageRequest pageRequest);
	
	/**
	 * 根据用户id，查询用户信息
	 * @param userId
	 * @return
	 */
	public SysUserResponseBO getSysUseById(int userId);
	
	/**
	 * 查询用户信息（不分页，不区分权限）
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public List<SysUserResponseBO> queryAll(SysUserRequestBO request);
	
	/**
	 * 获取session当前的用户信息
	 * @param session
	 * @return
	 */
	public SysUserResponseBO getSessionUserInfo(HttpSession session);
}

