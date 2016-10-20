package com.base.mvc.service;

import java.util.List;

import com.hp.tools.common.beans.Response;
import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;

/**
 * @author huangping
 * 2014-03-11
 */
public interface ISysMenuService {

	/**
	 * 按照权限，查询菜单
	 * @return
	 * @throws Exception
	 */
	public List<SysMenuResponseBO> queryAllSysMenu() throws Exception;
	
	/**
	 * 新增或修改
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Response<?> saveSysMenu(SysMenuRequestBO request) throws Exception;
	
	/**
	 * 删除菜单
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public Response<?> deleteSysMenu(int menuId) throws Exception;
	
}

