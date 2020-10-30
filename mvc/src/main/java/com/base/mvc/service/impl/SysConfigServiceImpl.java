/**
 * 
 */
package com.base.mvc.service.impl;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.common.constants.BaseConstant;
import com.base.common.convert.SysConfigConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.helper.SystemLoadHelper;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysConfigDAO;
import com.base.dal.model.SysConfig;
import com.base.model.request.SysConfigRequestBO;
import com.base.model.response.SysConfigResponseBO;
import com.base.mvc.service.ISysConfigService;
import com.hp.core.common.beans.Response;

/**
 * @author huangping 2016年8月28日 下午4:06:55
 */
@Service
public class SysConfigServiceImpl implements ISysConfigService {

	static Logger log = LoggerFactory.getLogger(SysConfigServiceImpl.class);

	@Resource
	private ISysConfigDAO sysConfigDAO;
	@Autowired
	private SystemLoadHelper systemLoadHelper;

	@Override
	public SysConfigResponseBO getSysConfigByKey(String key) {
		log.info("getSysConfigByKey with key={}", key);
		if (MapUtils.isEmpty(BaseConstant.SYS_CONFIG_MAP)) {
			systemLoadHelper.init();
		}
		SysConfigResponseBO config = BaseConstant.SYS_CONFIG_MAP.getOrDefault(key, new SysConfigResponseBO());
		log.info("getSysConfigByKey success. result={}, with key={}", config, key);
		return config;
	}

	@Override
	public Response<?> updateByConfigKey(SysConfigRequestBO request) {
		log.info("updateByConfigKey with request={}", request);
		
		//更新缓存
		BaseConstant.SYS_CONFIG_MAP.put(request.getConfigKey(), SysConfigConvert.request2Response(request));
		
		SysConfig config = sysConfigDAO.selectByConfigKey(request.getConfigKey());
		if (config == null) {
			//如果key不存在，则添加
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
			config = SysConfigConvert.bo2DalRequest(request);
			ResponseUtil.setAddBaseData(config);
			sysConfigDAO.insert(config);
		} else {
			//key存在，更新数据库
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.MODIFY.getValue());
			config = SysConfigConvert.bo2DalRequest(request);
			
			ResponseUtil.setUpdateBaseData(config);
			sysConfigDAO.updateByConfigKey(config);
		}
		
		log.info("updateByConfigKey success with request={}", request);
		return new Response<>();
	}
}
