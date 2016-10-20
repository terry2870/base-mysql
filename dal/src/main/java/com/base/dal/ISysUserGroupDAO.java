package com.base.dal;

import com.base.dal.model.SysUserGroup;

public interface ISysUserGroupDAO {
	int deleteByPrimaryKey(Integer groupId);

	int insert(SysUserGroup record);

	int insertSelective(SysUserGroup record);

	SysUserGroup selectByPrimaryKey(Integer groupId);

	int updateByPrimaryKeySelective(SysUserGroup record);

	int updateByPrimaryKey(SysUserGroup record);
}