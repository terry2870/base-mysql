/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.tools.common.beans.Response;
import com.base.model.response.SysUserRoleResponseBO;
import com.base.mvc.service.ISysUserRoleService;

/**
 * @author huangping
 * 2016年8月26日 上午12:36:12
 */
@Controller
@RequestMapping("/SysUserRoleController")
public class SysUserRoleController {

	Logger log = LoggerFactory.getLogger(SysUserRoleController.class);
	
	@Resource
	ISysUserRoleService sysUserRoleService;
	
	/**
	 * 查询该用户的角色
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectByUserId.do")
	@ResponseBody
	public Response<List<SysUserRoleResponseBO>> selectByUserId(int userId) throws Exception {
		log.info("selectByUserId with userId={}", userId);
		List<SysUserRoleResponseBO> list = sysUserRoleService.selectByUserId(userId);
		log.info("selectByUserId success. with userId={}", userId);
		if (list == null) {
			return new Response<>(new ArrayList<>());
		}
		return new Response<>(list);
	}
}
