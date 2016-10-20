/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.hp.tools.common.enums.StatusEnum;
import com.hp.tools.common.utils.DateUtil;
import com.base.dal.model.SysMenu;
import com.base.model.request.SysMenuRequestBO;
import com.base.model.response.SysMenuResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysMenuConvert {

	
	/**
	 * bo转为dal，request
	 * @param bo
	 * @return
	 */
	public static SysMenu bo2DalRequest(SysMenuRequestBO bo) {
		if (bo == null) {
			return null;
		}
		SysMenu menu = new SysMenu();
		BeanUtils.copyProperties(bo, menu);
		return menu;
	}
	
	
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysMenuResponseBO db2BOResponse(SysMenu menu) {
		if (menu == null) {
			return null;
		}
		SysMenuResponseBO bo = new SysMenuResponseBO();
		BeanUtils.copyProperties(menu, bo);
		bo.setStatusStr(menu.getStatus() == null ? "" : StatusEnum.getEnumByValue(menu.getStatus()).getText());
		bo.setCreateTimeStr(DateUtil.int2DateStr(menu.getCreateTime()));
		return bo;
	}
}
