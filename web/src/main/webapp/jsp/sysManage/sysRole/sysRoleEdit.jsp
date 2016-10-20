<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="sysRoleEditForm" id="sysRoleEditForm" method="post">
	<input type="hidden" name="roleId" id="roleId" value="<t:write name='roleId' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">角色名称：</td>
			<td width="70%"><input name="roleName" id="roleName" value="<t:write name='roleName'/>" class="easyui-textbox" data-options="required:true,prompt:'角色名称',width:200" /></td>
		</tr>
		<tr>
			<td align="right">角色描述：</td>
			<td><input name="roleInfo" id="roleInfo" value="<t:write name='roleInfo'/>" class="easyui-textbox" data-options="prompt:'角色描述',width:200,multiline:true" /></td>
		</tr>
		<tr>
			<td align="right">状态：</td>
			<td>
				<input name="status" id="status" />
			</td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		
		//状态
		$("#sysRoleEditForm #status").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.tools.common.enums.StatusEnum'
			},
			panelHeight : 100,
			editable : false,
			value : "<t:write name='status' defaultValue='<%=String.valueOf(StatusEnum.OPEN.getValue())%>' />",
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
		});
		
		$("#sysRoleEditForm").form();
	});
</script>

