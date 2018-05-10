/**
 * 
 */
package com.base.mvc.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageRequest;
import com.hp.core.common.beans.page.PageResponse;
import com.base.common.utils.SessionUtil;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysUserResponseBO;
import com.base.mvc.service.ISysUserService;

/**
 * @author huangping
 * 2016年8月26日 上午12:36:12
 */
@Controller
@RequestMapping("/SysUserController")
public class SysUserController {

	Logger log = LoggerFactory.getLogger(SysUserController.class);
	
	@Resource
	ISysUserService sysUserService;
	
	/**
	 * 查询用户列表
	 * @param request
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllSysUser.do")
	@ResponseBody
	public Response<PageResponse<SysUserResponseBO>> queryAllSysUser(SysUserRequestBO request, PageRequest pageRequest) throws Exception {
		log.info("queryAllSysUser with request={}", request);
		PageResponse<SysUserResponseBO> list = sysUserService.queryAllUser(request, pageRequest);
		log.info("queryAllSysUser success. with request={}", request);
		if (list == null) {
			return new Response<>(new PageResponse<>());
		}
		return new Response<>(list);
	}
	
	/**
	 * 保存用户
	 * @param request
	 * @param roleIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveSysUser.do")
	@ResponseBody
	public Response<?> saveSysUser(SysUserRequestBO request, String roleIds) throws Exception {
		log.info("saveSysUser with request={}, roleIds={}", request, roleIds);
		Response<?> response = sysUserService.saveUser(request, roleIds);
		log.info("saveSysUser success. with request={}, roleIds={}", request, roleIds);
		return response;
	}
	
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteSysUser.do")
	@ResponseBody
	public Response<?> deleteSysUser(int userId) throws Exception {
		log.info("deleteSysUser with userId={}", userId);
		Response<?> response = sysUserService.deleteUser(userId);
		log.info("deleteSysUser success. with userId={}", userId);
		return response;
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param oldPwd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPwd.do")
	@ResponseBody
	public Response<?> modifyPwd(String oldPwd, String newPwd) throws Exception {
		log.info("modifyPwd with userId={}", SessionUtil.getSessionUser().getUserId());
		Response<?> response = sysUserService.modifyPwd(oldPwd, newPwd);
		log.info("modifyPwd success. with userId={}", SessionUtil.getSessionUser().getUserId());
		return response;
	}
}
