/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.core.common.beans.Response;
import com.base.model.response.SysRoleMenuResponseBO;
import com.base.mvc.service.ISysRoleMenuService;

/**
 * @author huangping
 * 2016年9月11日 下午9:56:05
 */
@Controller
@RequestMapping("/SysRoleMenuController")
public class SysRoleMenuController {

	static Logger log = LoggerFactory.getLogger(SysRoleMenuController.class);
	
	@Resource
	ISysRoleMenuService sysRoleMenuService;
	
	/**
	 * 根据角色id，获取菜单
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/querySysMenuByRoleId.do")
	@ResponseBody
	public Response<List<SysRoleMenuResponseBO>> querySysMenuByRoleId(Integer roleId) throws Exception {
		log.info("querySysMenuByRoleId with roleId={}", roleId);
		List<SysRoleMenuResponseBO> list = sysRoleMenuService.selectByRoleId(roleId);
		log.info("queryUserSessionMenu success");
		if (CollectionUtils.isEmpty(list)) {
			return new Response<>(new ArrayList<>());
		}
		return new Response<>(list);
	}
	
	/**
	 * 保存角色菜单
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveSysRoleMenu.do")
	@ResponseBody
	public Response<?> saveSysRoleMenu(Integer roleId, String menuIds) throws Exception {
		log.info("saveSysRoleMenu with roleId={}, menuIds={}", roleId, menuIds);
		Response<?> response = sysRoleMenuService.saveSysRoleMenu(roleId, menuIds);
		log.info("saveSysRoleMenu response={}. with roleId={}, menuIds={}", response, roleId, menuIds);
		return response;
	}
}
