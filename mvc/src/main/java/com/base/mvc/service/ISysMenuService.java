package com.base.mvc.service;

import java.util.List;

import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;
import com.hp.core.common.beans.Response;

/**
 * @author huangping
 * 2014-03-11
 */
public interface ISysMenuService {

	/**
	 * 按照权限，查询菜单
	 * @return
	 */
	public List<SysMenuResponseBO> queryAllSysMenu();
	
	/**
	 * 新增或修改
	 * @param request
	 * @return
	 */
	public Response<?> saveSysMenu(SysMenuRequestBO request);
	
	/**
	 * 删除菜单
	 * @param menuId
	 * @return
	 */
	public Response<?> deleteSysMenu(int menuId);
	
	/**
	 * 根据id，查询菜单
	 * @param menuId
	 * @return
	 */
	public SysMenuResponseBO getSysMenuById(int menuId);
	
}

