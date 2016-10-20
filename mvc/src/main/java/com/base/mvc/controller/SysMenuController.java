package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.tools.common.beans.Response;
import com.base.common.constants.BaseConstant;
import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.base.mvc.service.ISysMenuService;


/**
 * @author huangping
 * 2013-08-15
 */
@Controller
@RequestMapping("/SysMenuController")
public class SysMenuController {
	
	static Logger log = LoggerFactory.getLogger(SysMenuController.class);

	@Resource
	ISysMenuService sysMenuService;
	
	/**
	 * 查询当前登录用户所能看到的菜单
	 * @throws Exception
	 */
	@RequestMapping("/queryAllSysMenu.do")
	@ResponseBody
	public List<SysMenuResponseBO> queryAllSysMenu() throws Exception {
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
	@ResponseBody
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
	@ResponseBody
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
	 * @throws Exception
	 */
	@RequestMapping("/saveSyMenu.do")
	@ResponseBody
	public Response<?> saveSyMenu(SysMenuRequestBO request) throws Exception {
		log.info("saveSyMenu with request={}", request);
		Response<?> response = sysMenuService.saveSysMenu(request);
		log.info("saveSyMenu success. with request={}", request);
		return response;
	}
	
	/**
	 * 删除菜单
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteSysMenu.do")
	@ResponseBody
	public Response<?> deleteSysMenu(int menuId) throws Exception {
		log.info("deleteSysMenu with menuId={}", menuId);
		Response<?> response = sysMenuService.deleteSysMenu(menuId);
		log.info("deleteSysMenu success. with menuId={}", menuId);
		return response;
	}
}


