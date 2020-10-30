/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.model.response.SysRoleMenuResponseBO;
import com.base.mvc.service.ISysRoleMenuService;
import com.hp.core.common.beans.Response;

/**
 * @author huangping
 * 2016年9月11日 下午9:56:05
 */
@RestController
@RequestMapping("/SysRoleMenuController")
public class SysRoleMenuController {

	private static Logger log = LoggerFactory.getLogger(SysRoleMenuController.class);
	
	@Autowired
	private ISysRoleMenuService sysRoleMenuService;
	
	/**
	 * 根据角色id，获取菜单
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/querySysMenuByRoleId.do")
	public Response<List<SysRoleMenuResponseBO>> querySysMenuByRoleId(Integer roleId) {
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
	 */
	@RequestMapping("/saveSysRoleMenu.do")
	public Response<?> saveSysRoleMenu(Integer roleId, String menuIds) {
		log.info("saveSysRoleMenu with roleId={}, menuIds={}", roleId, menuIds);
		Response<?> response = sysRoleMenuService.saveSysRoleMenu(roleId, menuIds);
		log.info("saveSysRoleMenu response={}. with roleId={}, menuIds={}", response, roleId, menuIds);
		return response;
	}
}
