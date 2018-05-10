<%@page import="com.hp.core.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="sysRoleEditForm" id="sysRoleEditForm" method="post" class="table_form">
	<input type="hidden" name="roleId" id="roleId" value="<t:write name='roleId' />" />
	<div class="table_style">
		<input name="roleName" id="roleName" value="<t:write name='roleName'/>" class="easyui-textbox" data-options="
			required : true,
			label : '角色名称：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '角色名称',
			width : 300
		" />
	</div>
	<div class="table_style">
		<input name="roleInfo" id="roleInfo" value="<t:write name='roleInfo'/>" class="easyui-textbox" data-options="
			prompt : '角色描述',
			label : '角色描述：',
			labelWidth : 100,
			width : 300,
			height : 70,
			multiline : true
		" />
	</div>
	<div class="table_style">
		<input name="status" id="status" />
	</div>
</form>
<script>
	$(function() {
		
		//状态
		$("#sysRoleEditForm #status").combobox({
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.core.common.enums.StatusEnum'
			},
			width : 300,
			label : '状态：',
			labelWidth : 100,
			cls : 'table_input',
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

