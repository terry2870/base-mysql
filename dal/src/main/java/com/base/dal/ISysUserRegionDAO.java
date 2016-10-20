package com.base.dal;

import com.base.dal.model.SysUserRegion;

public interface ISysUserRegionDAO {
	int insert(SysUserRegion record);

	int insertSelective(SysUserRegion record);
}