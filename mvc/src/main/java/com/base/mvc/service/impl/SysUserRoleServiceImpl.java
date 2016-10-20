/**
 * 
 */
package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hp.tools.common.beans.Response;
import com.base.common.convert.SysUserRoleConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysUserRoleDAO;
import com.base.dal.model.SysUserRole;
import com.base.model.response.SysUserRoleResponseBO;
import com.base.mvc.service.ISysUserRoleService;

/**
 * @author huangping
 * 2016年8月28日 下午4:24:44
 */
@Service
public class SysUserRoleServiceImpl implements ISysUserRoleService {

	static Logger log = LoggerFactory.getLogger(SysUserRoleServiceImpl.class);
	
	@Resource
	ISysUserRoleDAO sysUserRoleDAO;
	
	@Override
	public List<SysUserRoleResponseBO> selectByUserId(int userId) throws Exception {
		log.info("selectByUserId with userId={}", userId);
		List<SysUserRole> list = sysUserRoleDAO.selectByUserId(userId);
		if (CollectionUtils.isEmpty(list)) {
			log.warn("selectByUserId error, result is empty. with userId={}", userId);
			return null;
		}
		List<SysUserRoleResponseBO> respList = new ArrayList<>(list.size());
		for (SysUserRole role : list) {
			respList.add(SysUserRoleConvert.db2BOResponse(role));
		}
		log.info("selectByUserId with userId={}", userId);
		return respList;
	}

	@Override
	public Response<?> insertUserRole(int userId, String roleIds) throws Exception {
		log.info("insertUserRole with userId={}, roleIds={}", roleIds);
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
		//首先删除
		sysUserRoleDAO.deleteByUserId(userId);
		
		if (StringUtils.isNotEmpty(roleIds)) {
			String[] arr = roleIds.split(",");
			List<SysUserRole> list = new ArrayList<>(arr.length);
			for (String roleId : arr) {
				list.add(new SysUserRole(userId, Integer.parseInt(roleId)));
			}
			sysUserRoleDAO.insertBatch(list);
		}
		return new Response<>();
	}

}
