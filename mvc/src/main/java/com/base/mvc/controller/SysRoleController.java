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

import com.hp.tools.common.beans.Response;
import com.hp.tools.common.beans.page.PageRequest;
import com.hp.tools.common.beans.page.PageResponse;
import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;
import com.base.mvc.service.ISysRoleService;

/**
 * @author huangping
 * 2016年8月26日 上午12:36:12
 */
@Controller
@RequestMapping("/SysRoleController")
public class SysRoleController {

	Logger log = LoggerFactory.getLogger(SysRoleController.class);
	
	@Resource
	ISysRoleService sysRoleService;
	
	/**
	 * 查询角色
	 * @param request
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllSysRole.do")
	@ResponseBody
	public Response<PageResponse<SysRoleResponseBO>> queryAllSysRole(SysRoleRequestBO request, PageRequest pageRequest) throws Exception {
		log.info("queryAllSysRole with request={}", request);
		PageResponse<SysRoleResponseBO> list = sysRoleService.queryAllSysRole(request, pageRequest);
		if (list == null) {
			return new Response<>(new PageResponse<>());
		}
		log.info("queryAllSysRole success. with request={}", request);
		return new Response<>(list);
	}
	
	/**
	 * 保存角色数据
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveSysRole.do")
	@ResponseBody
	public Response<?> saveSysRole(SysRoleRequestBO request) throws Exception {
		log.info("saveSysRole with request={}", request);
		Response<?> response = sysRoleService.saveSysRole(request);
		log.info("saveSysRole success. with request={}", request);
		return response;
	}
	
	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteSysRole.do")
	@ResponseBody
	public Response<?> deleteSysRole(int roleId) throws Exception {
		log.info("deleteSysRole with roleId={}", roleId);
		Response<?> response = sysRoleService.deleteSysRole(roleId);
		log.info("deleteSysRole success. with roleId={}", roleId);
		return response;
	}
}
