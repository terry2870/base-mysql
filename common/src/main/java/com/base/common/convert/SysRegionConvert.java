/**
 * 
 */
package com.base.common.convert;

import org.springframework.beans.BeanUtils;

import com.base.dal.model.SysRegion;
import com.base.model.request.SysRegionRequestBO;
import com.base.model.response.SysRegionResponseBO;

/**
 * @author huangping
 * 2016年8月24日 上午12:36:02
 */
public class SysRegionConvert {

	
	/**
	 * bo转为dal，request
	 * @param bo
	 * @return
	 */
	public static SysRegion bo2DalRequest(SysRegionRequestBO bo) {
		if (bo == null) {
			return null;
		}
		SysRegion menu = new SysRegion();
		BeanUtils.copyProperties(bo, menu);
		return menu;
	}
	
	
	
	/**
	 * dal转为bo response
	 * @param user
	 * @return
	 */
	public static SysRegionResponseBO db2BOResponse(SysRegion menu) {
		if (menu == null) {
			return null;
		}
		SysRegionResponseBO bo = new SysRegionResponseBO();
		BeanUtils.copyProperties(menu, bo);
			return bo;
	}
}
