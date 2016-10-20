package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dal.model.SysUserRole;

public interface ISysUserRoleDAO {
	
	
	/**
	 * 批量新增用户与角色关系
	 * @param list
	 * @return
	 */
	int insertBatch(List<SysUserRole> list);
	
	/**
	 * 根据用户id，查询
	 * @param userId
	 * @return
	 */
	List<SysUserRole> selectByUserId(@Param("userId") int userId);
	
	/**
	 * 根据角色id，查询
	 * @param roleId
	 * @return
	 */
	List<SysUserRole> selectByRoleId(int roleId);
	
	
	/**
	 * 删除该用户的角色关系
	 * @param userId
	 * @return
	 */
	int deleteByUserId(int userId);
}