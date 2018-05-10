/**
 * 
 */
package com.base.common.helper;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.base.dal.ISysUserDAO;
import com.base.dal.model.SysUser;
import com.base.model.response.BaseResponseBO;
import com.hp.core.common.enums.StatusEnum;
import com.hp.core.common.utils.DateUtil;
import com.hp.core.common.utils.MapUtil;
import com.hp.core.common.utils.MapUtil.Function;

/**
 * @author huangping
 * 2016年9月18日 下午2:27:57
 */
@Component
public class BaseResponseHelper {

	
	static Logger log = LoggerFactory.getLogger(BaseResponseHelper.class);
	
	@Resource
	ISysUserDAO sysUserDAO;
	
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
	
	public void convertUserName(List<? extends BaseResponseBO> list) {
		convertUserName(list, "createUserId", "createUserName");
	}
	
	/**
	 * 设置名称
	 * @param list
	 * @param userIdField
	 * @param userNameField
	 */
	public void convertUserName(List<? extends BaseResponseBO> list, String userIdField, String userNameField) {
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		try {
			Set<String> userSet = new HashSet<>();
			for (BaseResponseBO bo : list) {
				String userId = BeanUtils.getProperty(bo, userIdField);
				if (StringUtils.isEmpty(userId)) {
					continue;
				}
				userSet.add(userId);
			}
			if (CollectionUtils.isEmpty(userSet)) {
				return;
			}
			Map<String, SysUser> userMap = null;
			List<SysUser> userList = sysUserDAO.selectByUserIds(StringUtils.join(userSet, ","));
			userMap = MapUtil.list2map(userList, new Function<String, SysUser>() {
				@Override
				public String apply(SysUser input) {
					return input.getUserId().toString();
				}
			});
			
			if (MapUtils.isEmpty(userMap)) {
				return;
			}
			
			SysUser user = null;
			for (BaseResponseBO bo : list) {
				user = userMap.get(BeanUtils.getProperty(bo, userIdField));
				if (user != null) {
					BeanUtils.setProperty(bo, userNameField, user.getUserName());
				}

			}
		} catch (Exception e) {
			log.error("", e);
		}
	}
}
