package com.base.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.common.constants.BaseConstant;
import com.base.common.enums.IdentityEnum;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.base.model.response.SysUserResponseBO;
import com.base.mvc.service.ISysMenuService;
import com.base.mvc.service.ISysUserService;
import com.hp.core.common.beans.Response;



/**
 * 登录controller
 * @author hp
 * 2014-03-11
 */
@RestController
@RequestMapping("/LoginController")
public class LoginController {
	
	private static Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysMenuService sysMenuService;
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/login.do")
	public Response<SysUserResponseBO> login(SysUserRequestBO request, String checkCode, HttpSession session) {
		log.info("login start with request={}, checkCode={}", request, checkCode);
		
		//检查验证码
		if (StringUtils.isEmpty(checkCode)) {
			log.warn("login error. checkCode is null. with request={}", request);
			return new Response<>(201, "验证码为空");
		}
		String sessionCheckCode = (String) session.getAttribute(BaseConstant.CHECK_CODE);
		if (!sessionCheckCode.equals(checkCode)) {
			log.warn("login error. checkCode is error. with request={}, checkCode={}", request, checkCode);
			return new Response<>(201, "验证码错误");
		}
		
		//调用登录
		Response<SysUserResponseBO> response = sysUserService.login(request);
		
		if (!ResponseUtil.success(response)) {
			return response;
		}
		
		int identity = response.getData().getIdentity().intValue();
		
		SessionUtil.getOperater().setUser(response.getData());
		SessionUtil.getOperater().setSuperUser(identity == IdentityEnum.SUPERUSER.getValue());
		SessionUtil.getOperater().setManager(identity == IdentityEnum.MANAGER.getValue());
		SessionUtil.getOperater().setNormalUser(identity != IdentityEnum.SUPERUSER.getValue() && identity != IdentityEnum.MANAGER.getValue());
		
		//查询用户所能看到的菜单
		List<SysMenuResponseBO> menuList = sysMenuService.queryAllSysMenu();
		
		//保存session
		session.setAttribute(BaseConstant.USER_SESSION, response.getData());
		session.setAttribute(BaseConstant.USER_MENU, menuList);
		
		log.info("login success with request={}, checkCode={}", request, checkCode);
		return response;
	}
	
	/**
	 * 获取登录的用户信息
	 * @return
	 */
	@RequestMapping("/getUserInfo.do")
	public Response<SysUserResponseBO> getUserInfo(HttpSession session) {
		return new Response<>(sysUserService.getSessionUserInfo(session));
	}


}

