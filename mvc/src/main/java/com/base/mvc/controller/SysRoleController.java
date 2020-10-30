/**
 * 
 */
package com.base.mvc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;
import com.base.mvc.service.ISysRoleService;
import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageResponse;
import com.hp.core.database.bean.PageRequest;

/**
 * @author huangping
 * 2016年8月26日 上午12:36:12
 */
@RestController
@RequestMapping("/SysRoleController")
public class SysRoleController {

	Logger log = LoggerFactory.getLogger(SysRoleController.class);
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	/**
	 * 查询角色
	 * @param request
	 * @param pageRequest
	 * @return
	 */
	@RequestMapping("/queryAllSysRole.do")
	public Response<PageResponse<SysRoleResponseBO>> queryAllSysRole(SysRoleRequestBO request, PageRequest pageRequest) {
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
	 */
	@RequestMapping("/saveSysRole.do")
	public Response<?> saveSysRole(SysRoleRequestBO request) {
		log.info("saveSysRole with request={}", request);
		Response<?> response = sysRoleService.saveSysRole(request);
		log.info("saveSysRole success. with request={}", request);
		return response;
	}
	
	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/deleteSysRole.do")
	public Response<?> deleteSysRole(int roleId) {
		log.info("deleteSysRole with roleId={}", roleId);
		Response<?> response = sysRoleService.deleteSysRole(roleId);
		log.info("deleteSysRole success. with roleId={}", roleId);
		return response;
	}
}
