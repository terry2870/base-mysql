package com.base.mvc.service;

import java.util.List;

import com.base.model.request.SysRegionRequestBO;
import com.base.model.response.SysRegionResponseBO;
import com.hp.core.common.beans.Response;

/**
 * 地区的接口
 * @author huangping<br />
 * 2013-1-31
 */
public interface ISysRegionService {

	/**
	 * 根据父节点编号，查询子节点（不递归）
	 * @param parentRegionId 父节点编号
	 * @return 返回所有的子结点
	 * @throws Exception
	 */
	public List<SysRegionResponseBO> queryRegionInfoByParentRegionId(int parentRegionId) throws Exception;
	
	/**
	 * 查询所有的地区
	 * @return 返回所有的地区信息
	 * @throws Exception
	 */
	public List<SysRegionResponseBO> queryAllRegion() throws Exception;
	
	/**
	 * 删除地区
	 * @param regionId
	 * @throws Exception
	 */
	public Response<?> deleteSysRegion(int regionId) throws Exception;
	

	/**
	 * 新增或修改地区
	 * @param request
	 * @throws Exception
	 */
	public Response<?> saveSysRegion(SysRegionRequestBO request) throws Exception;
}

