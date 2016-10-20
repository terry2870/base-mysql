package com.base.mvc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.tools.common.beans.Response;
import com.base.common.constants.BaseConstant;
import com.base.common.enums.IdentityEnum;
import com.base.common.interceptor.UrlInterceptor;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.base.model.response.SysUserResponseBO;
import com.base.mvc.service.ISysMenuService;
import com.base.mvc.service.ISysUserService;



/**
 * 登录controller
 * @author hp
 * 2014-03-11
 */
@Controller
@RequestMapping("/LoginController")
public class LoginController {
	
	static Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Resource
	ISysUserService sysUserService;
	
	@Resource
	ISysMenuService sysMenuService;
	
	@Resource
	UrlInterceptor urlInterceptor;
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public Response<SysUserResponseBO> login(SysUserRequestBO request, String checkCode, HttpSession session) throws Exception {
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
		
		SessionUtil.getOperater().setUser(response.getData());
		SessionUtil.getOperater().setSuperUser(response.getData().getIdentity().intValue() == IdentityEnum.SUPERUSER.getValue());
		SessionUtil.getOperater().setManager(response.getData().getIdentity().intValue() == IdentityEnum.MANAGER.getValue());
		SessionUtil.getOperater().setNormalUser(response.getData().getIdentity().intValue() == IdentityEnum.NORMAL.getValue());
		
		//查询用户所能看到的菜单
		List<SysMenuResponseBO> menuList = sysMenuService.queryAllSysMenu();
		
		//保存session
		session.setAttribute(BaseConstant.USER_SESSION, response.getData());
		session.setAttribute(BaseConstant.USER_MENU, menuList);
		
		log.info("login success with request={}, checkCode={}", request, checkCode);
		return response;
	}


}

