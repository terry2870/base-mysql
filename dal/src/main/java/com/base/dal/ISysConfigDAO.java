package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dal.model.SysConfig;

public interface ISysConfigDAO {
	int deleteByPrimaryKey(Integer id);

	int insert(SysConfig record);

	SysConfig selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(SysConfig record);

	int updateByPrimaryKey(SysConfig record);
	
	SysConfig selectByConfigKey(@Param("configKey") String configKey);
	
	List<SysConfig> selectAllConfigKey();
	
	int updateByConfigKey(SysConfig record);
}