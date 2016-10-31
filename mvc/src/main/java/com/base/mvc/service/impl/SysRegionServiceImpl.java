package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.base.common.convert.SysRegionConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysRegionDAO;
import com.base.dal.model.SysRegion;
import com.base.model.request.SysRegionRequestBO;
import com.base.model.response.SysRegionResponseBO;
import com.base.mvc.service.ISysRegionService;
import com.hp.tools.common.beans.Response;

/**
 * 地区接口实现
 * 
 * @author huangping<br />
 *         2013-1-31
 */
@Service
public class SysRegionServiceImpl implements ISysRegionService {

	static Logger log = LoggerFactory.getLogger(SysRegionServiceImpl.class);
	
	@Resource
	ISysRegionDAO sysRegionDAO;
	

	@Override
	public List<SysRegionResponseBO> queryRegionInfoByParentRegionId(int parentRegionId) throws Exception {
		log.info("queryRegionInfoByParentRegionId with parentRegionCode={}", parentRegionId);
		List<SysRegion> list = sysRegionDAO.queryRegionInfoByParentRegionId(parentRegionId);
		if (CollectionUtils.isEmpty(list)) {
			log.warn("queryRegionInfoByParentRegionId result is empty. with parentRegionId={}", parentRegionId);
			return null;
		}
		List<SysRegionResponseBO> respList = new ArrayList<>(list.size());
		for (SysRegion region : list) {
			respList.add(SysRegionConvert.db2BOResponse(region));
		}
		return respList;
	}

	@Override
	public List<SysRegionResponseBO> queryAllRegion() throws Exception {
		log.info("queryAllRegion");
		List<SysRegion> list = sysRegionDAO.queryAllRegion();
		if (CollectionUtils.isEmpty(list)) {
			log.warn("queryAllRegion result is empty.");
			return null;
		}
		List<SysRegionResponseBO> respList = new ArrayList<>(list.size());
		for (SysRegion region : list) {
			respList.add(SysRegionConvert.db2BOResponse(region));
		}
		return respList;
	}

	@Override
	public Response<?> deleteSysRegion(int regionId) throws Exception {
		log.info("deleteSysRegion with regionId={}", regionId);
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.DELETE.getValue());
		
		//判断该地区下是否有子地区
		List<SysRegion> list = sysRegionDAO.queryRegionInfoByParentRegionId(regionId);
		if (CollectionUtils.isNotEmpty(list)) {
			log.warn("deleteSysRegion error. region has child. with regionId={}", regionId);
			return new Response<>(201, "该地区下有子区域，不能删除");
		}
		
		sysRegionDAO.deleteByPrimaryKey(regionId);
		log.info("deleteSysRegion success. with regionId={}", regionId);
		return new Response<>();
	}

	@Override
	public Response<?> saveSysRegion(SysRegionRequestBO request) throws Exception {
		log.info("saveSysRegion with request={}", request);
		SysRegion region = SysRegionConvert.bo2DalRequest(request);
		if (region.getRegionId() == null || region.getRegionId() == 0) {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
			ResponseUtil.setAddBaseData(region);
			sysRegionDAO.insert(region);
		} else {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.MODIFY.getValue());
			ResponseUtil.setUpdateBaseData(region);
			sysRegionDAO.updateByPrimaryKey(region);
		}
		log.info("saveSysRegion success. with request={}", request);
		return new Response<>();
	}

}
