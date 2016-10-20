package com.base.dal;

import com.base.dal.model.SysUserActionLog;

public interface ISysUserActionLogDAO {
	int deleteByPrimaryKey(Integer logId);

	int insert(SysUserActionLog record);

	int insertSelective(SysUserActionLog record);

	SysUserActionLog selectByPrimaryKey(Integer logId);

	int updateByPrimaryKeySelective(SysUserActionLog record);

	int updateByPrimaryKeyWithBLOBs(SysUserActionLog record);

	int updateByPrimaryKey(SysUserActionLog record);
}