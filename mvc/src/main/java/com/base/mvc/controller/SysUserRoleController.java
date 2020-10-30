/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.model.response.SysUserRoleResponseBO;
import com.base.mvc.service.ISysUserRoleService;
import com.hp.core.common.beans.Response;

/**
 * @author huangping
 * 2016年8月26日 上午12:36:12
 */
@RestController
@RequestMapping("/SysUserRoleController")
public class SysUserRoleController {

	private static Logger log = LoggerFactory.getLogger(SysUserRoleController.class);
	
	@Autowired
	private ISysUserRoleService sysUserRoleService;
	
	/**
	 * 查询该用户的角色
	 * @param userId
	 * @return
	 */
	@RequestMapping("/selectByUserId.do")
	public Response<List<SysUserRoleResponseBO>> selectByUserId(int userId) {
		log.info("selectByUserId with userId={}", userId);
		List<SysUserRoleResponseBO> list = sysUserRoleService.selectByUserId(userId);
		log.info("selectByUserId success. with userId={}", userId);
		if (list == null) {
			return new Response<>(new ArrayList<>());
		}
		return new Response<>(list);
	}
}
