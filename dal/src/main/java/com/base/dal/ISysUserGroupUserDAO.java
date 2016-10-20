package com.base.dal;

import com.base.dal.model.SysUserGroupUser;

public interface ISysUserGroupUserDAO {
	int insert(SysUserGroupUser record);

	int insertSelective(SysUserGroupUser record);
}