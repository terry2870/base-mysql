/**
 * 
 */
package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageModel;
import com.hp.core.common.beans.page.PageRequest;
import com.hp.core.common.beans.page.PageResponse;
import com.hp.core.common.enums.StatusEnum;
import com.base.common.convert.SysRoleConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.helper.BaseResponseHelper;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysRoleDAO;
import com.base.dal.ISysRoleMenuDAO;
import com.base.dal.ISysUserRoleDAO;
import com.base.dal.model.SysRole;
import com.base.dal.model.SysUserRole;
import com.base.model.request.SysRoleRequestBO;
import com.base.model.response.SysRoleResponseBO;
import com.base.mvc.service.ISysRoleService;

/**
 * @author huangping
 * 2016年8月28日 下午4:06:55
 */
@Service
public class SysRoleServiceImpl implements ISysRoleService {

	static Logger log = LoggerFactory.getLogger(SysRoleServiceImpl.class);
	
	@Resource
	ISysRoleDAO sysRoleDAO;
	@Resource
	ISysRoleMenuDAO sysRoleMenuDAO;
	@Resource
	ISysUserRoleDAO sysUserRoleDAO;
	@Resource
	BaseResponseHelper baseResponseHelper;
	
	@Override
	public PageResponse<SysRoleResponseBO> queryAllSysRole(SysRoleRequestBO request, PageRequest pageRequest) throws Exception {
		log.info("queryAllSysRole with request={}", request);
		SysRole role = SysRoleConvert.bo2DalRequest(request);
		PageModel page = pageRequest.toPageModel();
		
		//查询总数
		int total = sysRoleDAO.selectSysRoleTotal(role, SessionUtil.getOperater());
		if (total == 0) {
			log.warn("queryAllSysRole error. with total=0. with request={}", request);
			return null;
		}
		List<SysRole> list = sysRoleDAO.selectSysRoleList(role, page, SessionUtil.getOperater());
		List<SysRoleResponseBO> respList = new ArrayList<>();
		for (SysRole u : list) {
			respList.add(SysRoleConvert.db2BOResponse(u));
		}
		baseResponseHelper.convert(respList);
		log.info("queryAllSysRole success. with request={}", request);
		return new PageResponse<>(total, respList);
	}
	
	@Override
	public Response<?> saveSysRole(SysRoleRequestBO request) throws Exception {
		log.info("saveSysRole with request={}", request);
		SysRole ar = SysRoleConvert.bo2DalRequest(request);
		
		SysRole r = sysRoleDAO.selectByRoleName(request.getRoleName());
		
		if (request.getRoleId() == null || request.getRoleId().intValue() == 0) {
			if (r != null) {
				log.warn("saveSysRole error. roleName is exists. with request={}", request);
				return new Response<>(201, "角色名称重复");
			}
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
			//新增
			ResponseUtil.setAddBaseData(ar);
			sysRoleDAO.insert(ar);
		} else {
			if (r != null && r.getRoleId().intValue() != request.getRoleId().intValue()) {
				log.warn("saveSysRole error. roleName is exists. with request={}", request);
				return new Response<>(201, "角色名称重复");
			}
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.MODIFY.getValue());
			ResponseUtil.setUpdateBaseData(ar);
			sysRoleDAO.updateByPrimaryKey(ar);
		}
		log.info("saveSysRole success with request={}", request);
		return new Response<>();
	}

	@Override
	public Response<?> deleteSysRole(int roleId) throws Exception {
		log.info("deleteSysRole with roleId={}", roleId);
		
		/*List<SysRoleMenu> roleMenuList = sysRoleMenuDAO.selectByRoleId(roleId);
		if (CollectionUtils.isNotEmpty(roleMenuList)) {
			log.warn("deleteSysRole error. role have menu bind. with roleId={}", roleId);
			return new Response<>(201, "该角色有菜单绑定，不能删除");
		}*/
		List<SysUserRole> userRoleList = sysUserRoleDAO.selectByRoleId(roleId);
		if (CollectionUtils.isNotEmpty(userRoleList)) {
			log.warn("deleteSysRole error. role have user bind. with roleId={}", roleId);
			return new Response<>(201, "该角色有用户绑定，不能删除");
		}
		
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.DELETE.getValue());
		SysRole ar = new SysRole();
		ar.setRoleId(roleId);
		ar.setStatus((byte) StatusEnum.DELETE.getValue());
		sysRoleDAO.updateByPrimaryKeySelective(ar);
		log.info("deleteSysRole success with roleId={}", roleId);
		return new Response<>();
	}

	
}
