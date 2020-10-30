package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.model.request.SysRegionRequestBO;
import com.base.model.response.SysRegionResponseBO;
import com.base.mvc.service.ISysRegionService;
import com.hp.core.common.beans.Response;


/**
 * 
 * @author huangping<br />
 * 2013-2-4
 */
@RestController
@RequestMapping("/SysRegionController")
public class SysRegionController {

	static Logger log = LoggerFactory.getLogger(SysRegionController.class);
	
	@Autowired
	private ISysRegionService sysRegionService;

	/**
	 * 查询所有的地区
	 * @return
	 */
	@RequestMapping("/queryAllRegion.do")
	public List<SysRegionResponseBO> queryAllRegion() {
		log.info("queryAllRegion");
		List<SysRegionResponseBO> list = sysRegionService.queryAllRegion();
		if (list == null) {
			return new ArrayList<>();
		}
		log.info("queryAllRegion success");
		return list;
	}
	
	/**
	 * 删除地区
	 * @param regionId
	 * @return
	 */
	@RequestMapping("/deleteSysregion.do")
	public Response<?> deleteSysregion(int regionId) {
		log.info("deleteSysregion with regionId={}", regionId);
		Response<?> response = sysRegionService.deleteSysRegion(regionId);
		log.info("deleteSysregion success with regionId={}", regionId);
		return response;
	}

	/**
	 * 保存区域
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveSysRegion.do")
	public Response<?> saveSysRegion(SysRegionRequestBO request) {
		log.info("saveSysRegion with request={}", request);
		Response<?> response = sysRegionService.saveSysRegion(request);
		log.info("saveSysRegion success with request={}", request);
		return response;
	}
}

