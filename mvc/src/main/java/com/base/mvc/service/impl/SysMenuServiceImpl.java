package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.base.common.convert.SysMenuConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysMenuDAO;
import com.base.dal.ISysRoleMenuDAO;
import com.base.dal.model.SysMenu;
import com.base.dal.model.SysRoleMenu;
import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.base.model.response.SysUserResponseBO;
import com.base.mvc.service.ISysMenuService;
import com.hp.core.common.beans.Response;
import com.hp.core.common.exceptions.CommonException;

/**
 * @author huangping
 * 2014-03-11
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService {

	static Logger log = LoggerFactory.getLogger(SysMenuServiceImpl.class);
	
	@Resource
	ISysMenuDAO sysMenuDAO;
	@Resource
	ISysRoleMenuDAO sysRoleMenuDAO;

	@Override
	public List<SysMenuResponseBO> queryAllSysMenu() throws Exception {
		log.info("queryAllSysMenu start");
		SysUserResponseBO user = SessionUtil.getSessionUser();
		List<SysMenu> list = null;
		if (SessionUtil.isSuperUser()) {
			//超级管理员，直接看到所有菜单
			list = sysMenuDAO.selectAllSysMenu();
		} else {
			//其他用户，只能看到分配的菜单
			List<Integer> menuIds = sysRoleMenuDAO.selectByUserId(user.getUserId());
			if (CollectionUtils.isEmpty(menuIds)) {
				log.warn("queryAllSysMenu error. menu is empty");
				return null;
			}
			list = sysMenuDAO.selectSysMenu(StringUtils.join(menuIds, ","));
		}
		if (CollectionUtils.isEmpty(list)) {
			log.warn("queryAllSysMenu error. with result is empty");
			return null;
		}
		List<SysMenuResponseBO> respList = new ArrayList<>(list.size());
		for (SysMenu menu : list) {
			respList.add(SysMenuConvert.db2BOResponse(menu));
		}
		return respList;
	}

	@Override
	public Response<?> saveSysMenu(SysMenuRequestBO request) throws Exception {
		log.info("saveSysMenu with request={}", request);
		SysMenu m = sysMenuDAO.selectByMenuNameAndPid(request.getMenuName(), request.getParentMenuId());
		SysMenu menu = SysMenuConvert.bo2DalRequest(request);
		if (request.getMenuId() == null || request.getMenuId().intValue() == 0) {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
			if (m != null) {
				log.warn("saveSysMenu error. with menuName is exists");
				return new Response<>(201, "菜单名称重复");
			}
			//新增
			ResponseUtil.setAddBaseData(menu);
			sysMenuDAO.insert(menu);
		} else {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.MODIFY.getValue());
			
			if (m != null && m.getMenuId().intValue() != menu.getMenuId().intValue()) {
				log.warn("saveSysMenu error. with menuName is exists");
				return new Response<>(201, "菜单名称重复");
			}
			ResponseUtil.setUpdateBaseData(menu);
			sysMenuDAO.updateByPrimaryKey(menu);
		}
		log.info("saveSysMenu success with request={}", request);
		return new Response<>();
	}

	@Override
	public Response<?> deleteSysMenu(int menuId) throws Exception {
		log.info("deleteSysMenu with menuId={}", menuId);
		List<SysRoleMenu> roleMenuList = sysRoleMenuDAO.selectByMenuId(menuId);
		if (CollectionUtils.isNotEmpty(roleMenuList)) {
			log.warn("deleteSysMenu error. menu have role bind. with menuId={}", menuId);
			return new Response<>(201, "菜单有角色绑定，不能删除");
		}
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.DELETE.getValue());
		sysMenuDAO.deleteByPrimaryKey(menuId);
		log.info("deleteSysMenu success with menuId={}", menuId);
		return new Response<>();
	}
	
	@Override
	public SysMenuResponseBO getSysMenuById(int menuId) throws CommonException {
		log.info("getSysMenuById menuId={}", menuId);
		SysMenu menu = sysMenuDAO.selectByPrimaryKey(menuId);
		log.info("getSysMenuById menuId={}, menu={}", menuId, menu);
		return SysMenuConvert.db2BOResponse(menu);
	}

}

