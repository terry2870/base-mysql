package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dal.model.RegionInfos;
import com.base.dal.model.SysRegion;

public interface ISysRegionDAO {
	int deleteByPrimaryKey(@Param("regionId") Integer regionId);

	int insert(SysRegion record);

	SysRegion selectByPrimaryKey(Integer regionId);

	int updateByPrimaryKeySelective(SysRegion record);

	int updateByPrimaryKey(SysRegion record);
	
	List<SysRegion> queryRegionInfoByParentRegionId(@Param("parentRegionId") int parentRegionId);
	
	List<SysRegion> queryAllRegion();
	
	List<RegionInfos> selectRegionByTownIdRecursion(@Param("regionIds") String regionIds);
}