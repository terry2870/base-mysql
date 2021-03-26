package com.base.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.common.constants.BaseConstant;
import com.base.common.convert.SysUserConvert;
import com.base.common.enums.ActionTypeEnum;
import com.base.common.helper.BaseResponseHelper;
import com.base.common.utils.ResponseUtil;
import com.base.common.utils.SessionUtil;
import com.base.dal.ISysUserDAO;
import com.base.dal.model.SysUser;
import com.base.model.OperaBean;
import com.base.model.request.SysUserRequestBO;
import com.base.model.response.SysUserResponseBO;
import com.base.model.response.SysUserRoleResponseBO;
import com.base.mvc.service.ISysUserRoleService;
import com.base.mvc.service.ISysUserService;
import com.hp.core.common.beans.Response;
import com.hp.core.common.beans.page.PageResponse;
import com.hp.core.common.enums.StatusEnum;
import com.hp.core.common.exceptions.CommonException;
import com.hp.core.common.utils.DateUtil;
import com.hp.core.common.utils.MD5Util;
import com.hp.core.database.bean.PageModel;
import com.hp.core.database.bean.PageRequest;

/**
 * 用户接口实现
 * @author huangping
 * 2014-02-14
 */
@Service
public class SysUserServiceImpl implements ISysUserService {

	private static Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);
	
	@Autowired
	private ISysUserDAO sysUserDAO;
	@Autowired
	private ISysUserRoleService sysUserRoleService;
	@Autowired
	private BaseResponseHelper baseResponseHelper;

	@Override
	public Response<SysUserResponseBO> login(SysUserRequestBO request) {
		log.info("login start with request={}", request);
		OperaBean opera = SessionUtil.getOperater();
		opera.setOperaType(ActionTypeEnum.LOGIN.getValue());
		
		if (StringUtils.isEmpty(request.getLoginName())) {
			log.warn("login error with loginName is empty. with request={}", request);
			return new Response<>(201, "登录名为空");
		}
		if (StringUtils.isEmpty(request.getLoginPwd())) {
			log.warn("login error with loginPwd is empty. with request={}", request);
			return new Response<>(201, "，密码为空");
		}
		SysUser user = sysUserDAO.login(request.getLoginName(), MD5Util.getMD5(request.getLoginPwd()));
		if (user == null) {
			log.warn("login error with login error. with request={}", request);
			return new Response<>(201, "用户名或密码错误");
		}
		
		//更新最后登录时间
		SysUser u = new SysUser();
		u.setUserId(user.getUserId());
		u.setLastLoginTime(DateUtil.getCurrentTimeSeconds());
		sysUserDAO.updateByPrimaryKeySelective(u);
		
		SysUserResponseBO response = SysUserConvert.db2BOResponse(user);
		log.info("login success with request={}", request);
		return new Response<SysUserResponseBO>(response);
	}

	@Override
	public Response<?> saveUser(SysUserRequestBO request, String roleIds) {
		log.info("saveUser with request={}, roleIds={}", request, roleIds);
		int userId = request.getUserId();
		if (userId == 0) {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.ADD.getValue());
			SysUser checkUser = sysUserDAO.selectByLoginNameOrUserName(request.getLoginName(), null);
			if (checkUser != null) {
				log.warn("saveUser error. loginName is exists. with request={}", request);
				return new Response<>(201, "登录名重复");
			}
			checkUser = sysUserDAO.selectByLoginNameOrUserName(null, request.getUserName());
			if (checkUser != null) {
				log.warn("saveUser error. userName is exists. with request={}", request);
				return new Response<>(201, "用户名重复");
			}
			
			SysUser user = SysUserConvert.bo2DalRequest(request);
			ResponseUtil.setAddBaseData(user);
			user.setLoginPwd(MD5Util.getMD5(request.getLoginPwd()));
			sysUserDAO.insert(user);
			userId = user.getUserId();
		} else {
			SessionUtil.getOperater().setOperaType(ActionTypeEnum.MODIFY.getValue());
			SysUser checkUser = sysUserDAO.selectByLoginNameOrUserName(request.getLoginName(), null);
			if (checkUser != null && checkUser.getUserId().intValue() != request.getUserId().intValue()) {
				log.warn("saveUser error. loginName is exists. with request={}", request);
				return new Response<>(201, "登录名重复");
			}
			checkUser = sysUserDAO.selectByLoginNameOrUserName(null, request.getUserName());
			if (checkUser != null && checkUser.getUserId().intValue() != request.getUserId().intValue()) {
				log.warn("saveUser error. userName is exists. with request={}", request);
				return new Response<>(201, "用户名重复");
			}
			
			SysUser user = SysUserConvert.bo2DalRequest(request);
			ResponseUtil.setUpdateBaseData(user);
			sysUserDAO.updateByPrimaryKey(user);
		}
		
		//保存用户角色
		sysUserRoleService.insertUserRole(userId, roleIds);
		log.info("saveUser success. with request={}, roleIds={}", request, roleIds);
		return new Response<>();
	}

	@Override
	public Response<?> deleteUser(int userId) {
		log.info("deleteUser with userId={}", userId);
		
		List<SysUser> list = sysUserDAO.selectByCreateUserId(userId);
		if (CollectionUtils.isNotEmpty(list)) {
			log.warn("deleteUser error. user have child user. with userId={}", userId);
			return new Response<>(201, "该用户有子用户，不能删除");
		}
		
		List<SysUserRoleResponseBO> userRoleList = sysUserRoleService.selectByUserId(userId);
		if (CollectionUtils.isNotEmpty(userRoleList)) {
			log.warn("deleteUser error. user have role bind. with userId={}", userId);
			return new Response<>(201, "该用户有角色关联，不能删除");
		}
		
		SessionUtil.getOperater().setOperaType(ActionTypeEnum.DELETE.getValue());
		SysUser user = new SysUser();
		user.setUserId(userId);
		user.setStatus(StatusEnum.DELETE.getValue());
		sysUserDAO.updateByPrimaryKeySelective(user);
		log.info("deleteUser success. with userId={}", userId);
		return new Response<>();
	}

	@Override
	public Response<?> modifyPwd(String oldPwd, String newPwd) {
		int userId = SessionUtil.getSessionUser().getUserId();
		log.info("enter modifyPwd with userId={}", userId);
		
		//根据userId查询用户信息
		SysUser user = sysUserDAO.selectByPrimaryKey(userId);
		if (user == null) {
			log.warn("modifyPwd error. user is not exitst. with userId={}", userId);
			return new Response<>(201, "用户不存在");
		}
		if (!user.getLoginPwd().equals(MD5Util.getMD5(oldPwd))) {
			log.warn("modifyPwd error. with oldPwd error. with userId={}", userId);
			return new Response<>(202, "原密码错误");
		}
		user = new SysUser();
		user.setUserId(userId);
		user.setLoginPwd(MD5Util.getMD5(newPwd));
		sysUserDAO.updateByPrimaryKeySelective(user);
		return new Response<>();
	}

	@Override
	public PageResponse<SysUserResponseBO> queryAllUser(SysUserRequestBO request, PageRequest pageRequest) {
		log.info("queryAllUser with request={}", request);
		SysUser user = SysUserConvert.bo2DalRequest(request);
		PageModel page = pageRequest.toPageModel();
		
		//查询总数
		int total = sysUserDAO.selectSysUserTotal(user, page, SessionUtil.getOperater());
		if (total == 0) {
			log.warn("queryAllUser error. with total=0. with request={}", request);
			return null;
		}
		List<SysUser> list = sysUserDAO.selectSysUserList(user, page, SessionUtil.getOperater());
		List<SysUserResponseBO> respList = new ArrayList<>();
		for (SysUser u : list) {
			respList.add(SysUserConvert.db2BOResponse(u));
		}
		baseResponseHelper.convert(respList);
		log.info("queryAllUser success. with request={}", request);
		return new PageResponse<>(total, respList);
	}
	
	@Override
	public SysUserResponseBO getSysUseById(int userId) throws CommonException {
		log.info("getSysUseById with userId={}", userId);
		SysUser user = sysUserDAO.selectByPrimaryKey(userId);
		log.info("getSysUseById with userId={}, user={}", userId, user);
		return SysUserConvert.db2BOResponse(user);
	}

	@Override
	public List<SysUserResponseBO> queryAll(SysUserRequestBO request) {
		log.info("queryAll with request={}", request);
		SysUser user = SysUserConvert.bo2DalRequest(request);
		List<SysUser> list = sysUserDAO.selectAllUserList(user);
		List<SysUserResponseBO> respList = new ArrayList<>();
		for (SysUser u : list) {
			respList.add(SysUserConvert.db2BOResponse(u));
		}
		baseResponseHelper.convert(respList);
		log.info("queryAll success with request={}", request);
		return respList;
	}

	@Override
	public SysUserResponseBO getSessionUserInfo(HttpSession session) {
		return (SysUserResponseBO) session.getAttribute(BaseConstant.USER_SESSION);
	}

}


