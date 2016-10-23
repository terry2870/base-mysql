/**
 * 
 */
package com.base.common.helper;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.base.model.response.BaseResponseBO;
import com.hp.tools.common.enums.StatusEnum;
import com.hp.tools.common.utils.DateUtil;

/**
 * @author huangping
 * 2016年9月18日 下午2:27:57
 */
@Component
public class BaseResponseHelper {

	
	static Logger log = LoggerFactory.getLogger(BaseResponseHelper.class);
	
	/**
	 * 设置员工名
	 * @param list
	 */
	public void convert(List<? extends BaseResponseBO> list) {
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		for (BaseResponseBO bo : list) {
			bo.setUpdateTimeStr(bo.getUpdateTime() == null ? "" : DateUtil.int2DateStr(bo.getUpdateTime()));
			bo.setStatusStr(bo.getStatus() == null ? "" : StatusEnum.getEnumByValue(bo.getStatus()).getText());
			bo.setCreateTimeStr(bo.getCreateTime() == null ? "" : DateUtil.int2DateStr(bo.getCreateTime()));
		}
	}
}
