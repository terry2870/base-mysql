package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.common.constants.BaseConstant;
import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.base.mvc.service.ISysMenuService;
import com.hp.core.common.beans.Response;


/**
 * @author huangping
 * 2013-08-15
 */
@RestController
@RequestMapping("/SysMenuController")
public class SysMenuController {
	
	static Logger log = LoggerFactory.getLogger(SysMenuController.class);

	@Autowired
	private ISysMenuService sysMenuService;
	
	/**
	 * 查询当前登录用户所能看到的菜单
	 */
	@RequestMapping("/queryAllSysMenu.do")
	public List<SysMenuResponseBO> queryAllSysMenu() {
		log.info("queryAllSysMenu start");
		List<SysMenuResponseBO> list = sysMenuService.queryAllSysMenu();
		if (list == null) {
			return new ArrayList<>();
		}
		log.info("queryAllSysMenu success");
		return list;
	}
	
	/**
	 * 查询用户的权限菜单（从session中获取）
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/queryUserSessionMenu.do")
	public Response<List<SysMenuResponseBO>> queryUserSessionMenu(HttpSession session) {
		log.info("queryUserSessionMenu start");
		List<SysMenuResponseBO> list = (List<SysMenuResponseBO>) session.getAttribute(BaseConstant.USER_MENU);
		log.info("queryUserSessionMenu success");
		return new Response<>(list);
	}
	
	/**
	 * 根据菜单id，查询该菜单下的按钮
	 * @param session
	 * @param menuId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/querySessionButtonByMenuId.do")
	public Response<List<SysMenuResponseBO>> querySessionButtonByMenuId(HttpSession session, Integer menuId) {
		log.info("querySessionButtonByMenuId start");
		List<SysMenuResponseBO> list = (List<SysMenuResponseBO>) session.getAttribute(BaseConstant.USER_MENU);
		List<SysMenuResponseBO> respList = new ArrayList<>();
		for (SysMenuResponseBO bo : list) {
			if (bo.getParentMenuId().intValue() == menuId.intValue()) {
				respList.add(bo);
			}
		}
		log.info("querySessionButtonByMenuId success");
		return new Response<>(respList);
	}
	
	/**
	 * 保存菜单数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveSyMenu.do")
	public Response<?> saveSyMenu(SysMenuRequestBO request) {
		log.info("saveSyMenu with request={}", request);
		Response<?> response = sysMenuService.saveSysMenu(request);
		log.info("saveSyMenu success. with request={}", request);
		return response;
	}
	
	/**
	 * 删除菜单
	 * @param userId
	 * @return
	 */
	@RequestMapping("/deleteSysMenu.do")
	public Response<?> deleteSysMenu(int menuId) {
		log.info("deleteSysMenu with menuId={}", menuId);
		Response<?> response = sysMenuService.deleteSysMenu(menuId);
		log.info("deleteSysMenu success. with menuId={}", menuId);
		return response;
	}
}


