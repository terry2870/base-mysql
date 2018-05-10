/**
 * 
 */
package com.base.common.helper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.base.common.constants.BaseConstant;
import com.base.common.convert.SysConfigConvert;
import com.base.dal.ISysConfigDAO;
import com.base.dal.model.SysConfig;

/**
 * @author ping.huang
 * 2017年1月3日
 */
@Component
public class SystemLoadHelper {

	@Resource
	ISysConfigDAO sysConfigDAO;
	
	static Logger log = LoggerFactory.getLogger(SystemLoadHelper.class);
	
	/**
	 * 初始化系统做一些事情
	 */
	public void init() {
		//加载系统配置变量
		loadSysConfig();
	}
	
	/**
	 * 加载系统配置变量
	 */
	private void loadSysConfig() {
		log.info("loadSysConfig start.");
		List<SysConfig> configList = sysConfigDAO.selectAllConfigKey();
		if (CollectionUtils.isEmpty(configList)) {
			log.warn("loadSysConfig error. config is empty");
			return;
		}
		for (SysConfig config : configList) {
			BaseConstant.SYS_CONFIG_MAP.put(config.getConfigKey(), SysConfigConvert.db2BOResponse(config));
		}
		log.info("loadSysConfig end.");
	}
}
