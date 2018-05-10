package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hp.core.common.beans.page.PageModel;
import com.base.dal.model.SysUser;
import com.base.model.OperaBean;

public interface ISysUserDAO {
	int deleteByPrimaryKey(Integer userId);

	int insert(SysUser record);
	
	SysUser selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(SysUser record);

	int updateByPrimaryKey(SysUser record);
	
	/**
	 * 登录
	 * @param loginName
	 * @param loginPwd
	 * @return
	 */
	SysUser login(@Param("loginName") String loginName, @Param("loginPwd") String loginPwd);
	
	/**
	 * 查询用户列表
	 * @param user
	 * @param page
	 * @param opera
	 * @return
	 */
	List<SysUser> selectSysUserList(@Param("user") SysUser user, @Param("page") PageModel page, @Param("opera") OperaBean opera);
	
	/**
	 * 查询用户总数
	 * @param user
	 * @param page
	 * @param opera
	 * @return
	 */
	int selectSysUserTotal(@Param("user") SysUser user, @Param("page") PageModel page, @Param("opera") OperaBean opera);
	
	/**
	 * 根据登录名或用户名查询
	 * @param loginName
	 * @param userName
	 * @return
	 */
	SysUser selectByLoginNameOrUserName(@Param("loginName") String loginName, @Param("userName") String userName);
	
	/**
	 * 根据父id，查询子用户
	 * @param createUserId
	 * @return
	 */
	List<SysUser> selectByCreateUserId(Integer createUserId);
	
	/**
	 * 根据userId批量查询用户
	 * @param userIds
	 * @return
	 */
	List<SysUser> selectByUserIds(@Param("userIds") String userIds);
	
	/**
	 * 根据身份，查找用户
	 * @param identity
	 * @return
	 */
	List<SysUser> selectByIdentity(@Param("identitys") String identitys);
	
	/**
	 * 查询用户列表
	 * @param user
	 * @return
	 */
	List<SysUser> selectAllUserList(@Param("user") SysUser user);
}