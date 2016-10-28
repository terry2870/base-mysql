package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.model.request.SysRegionRequestBO;
import com.base.model.response.SysRegionResponseBO;
import com.base.mvc.service.ISysRegionService;
import com.hp.tools.common.beans.Response;


/**
 * 
 * @author huangping<br />
 * 2013-2-4
 */
@Controller
@RequestMapping("/SysRegionController")
public class SysRegionController {

	static Logger log = LoggerFactory.getLogger(SysRegionController.class);
	
	@Resource
	ISysRegionService sysRegionService;

	/**
	 * 查询所有的地区
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllRegion.do")
	@ResponseBody
	public List<SysRegionResponseBO> queryAllRegion() throws Exception {
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
	 * @throws Exception
	 */
	@RequestMapping("/deleteSysregion.do")
	@ResponseBody
	public Response<?> deleteSysregion(int regionId) throws Exception {
		log.info("deleteSysregion with regionId={}", regionId);
		Response<?> response = sysRegionService.deleteSysRegion(regionId);
		log.info("deleteSysregion success with regionId={}", regionId);
		return response;
	}

	/**
	 * 保存区域
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveSysRegion.do")
	@ResponseBody
	public Response<?> saveSysRegion(SysRegionRequestBO request) throws Exception {
		log.info("saveSysRegion with request={}", request);
		Response<?> response = sysRegionService.saveSysRegion(request);
		log.info("saveSysRegion success with request={}", request);
		return response;
	}
}

