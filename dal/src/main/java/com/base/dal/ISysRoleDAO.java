package com.base.dal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dal.model.SysRole;
import com.base.model.OperaBean;
import com.hp.core.database.bean.PageModel;

public interface ISysRoleDAO {
	int deleteByPrimaryKey(Integer roleId);

	int insert(SysRole record);

	SysRole selectByPrimaryKey(Integer roleId);

	int updateByPrimaryKeySelective(SysRole record);

	int updateByPrimaryKey(SysRole record);
	
	/**
	 * 查询角色列表
	 * @param role
	 * @param page
	 * @param opera
	 * @return
	 */
	List<SysRole> selectSysRoleList(@Param("role") SysRole role, @Param("page") PageModel page, @Param("opera") OperaBean opera);
	
	/**
	 * 查询角色总数
	 * @param role
	 * @param opera
	 * @return
	 */
	int selectSysRoleTotal(@Param("role") SysRole role, @Param("opera") OperaBean opera);
	
	/**
	 * 根据角色名称查询
	 * @param roleName
	 * @return
	 */
	SysRole selectByRoleName(String roleName);
}