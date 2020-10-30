/**
 * 
 */
package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.common.convert.SysRoleMenuConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysRoleMenuDAO;
import com.base.dal.model.SysRoleMenu;
import com.base.model.response.SysRoleMenuResponseBO;
import com.base.mvc.service.ISysRoleMenuService;
import com.hp.core.common.beans.Response;

/**
 * @author huangping
 * 2016年9月11日 下午9:31:03
 */
@Service
public class SysRoleMenuServiceImpl implements ISysRoleMenuService {

	private static Logger log = LoggerFactory.getLogger(SysRoleMenuServiceImpl.class);
	
	@Autowired
	private ISysRoleMenuDAO sysRoleMenuDAO;
	
	@Override
	public List<SysRoleMenuResponseBO> selectByRoleId(Integer roleId) {
		log.info("selectByRoleId with roleId={}", roleId);
		List<SysRoleMenu> list = sysRoleMenuDAO.selectByRoleId(roleId);
		if (CollectionUtils.isEmpty(list)) {
			log.warn("selectByRoleId result is empty. with roleId={}", roleId);
			return null;
		}
		List<SysRoleMenuResponseBO> respList = new ArrayList<>(list.size());
		for (SysRoleMenu roleMenu : list) {
			respList.add(SysRoleMenuConvert.db2BOResponse(roleMenu));
		}
		return respList;
	}

	@Override
	public List<SysRoleMenuResponseBO> selectByMenuId(Integer menuId) {
		log.info("selectByMenuId with menuId={}", menuId);
		List<SysRoleMenu> list = sysRoleMenuDAO.selectByMenuId(menuId);
		List<SysRoleMenuResponseBO> respList = new ArrayList<>(list.size());
		for (SysRoleMenu roleMenu : list) {
			respList.add(SysRoleMenuConvert.db2BOResponse(roleMenu));
		}
		return respList;
	}

	@Override
	public Response<?> saveSysRoleMenu(Integer roleId, String menuIds) {
		log.info("saveSysRoleMenu with roleId={}", roleId);
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
		//删除以前的菜单
		sysRoleMenuDAO.deleteByRoleId(roleId);
		
		//插入新菜单
		if (StringUtils.isEmpty(menuIds)) {
			log.warn("saveSysRoleMenu with new menuId is empty.");
			return new Response<>();
		}
		String[] arr = menuIds.split(",");
		List<SysRoleMenu> list = new ArrayList<>(arr.length);
		for (String menuId : arr) {
			list.add(new SysRoleMenu(roleId, Integer.parseInt(menuId)));
		}
		sysRoleMenuDAO.insertBatch(list);
		return new Response<>();
	}

}
