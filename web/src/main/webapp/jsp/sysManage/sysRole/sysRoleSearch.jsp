<%@page import="com.hp.core.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="sysRoleSearchDiv" class="search_text">
	<div class="search_div">
		<input type="text" id="roleName" class="easyui-textbox" data-options="prompt:'角色名称',width:150" />
	</div>
	<div class="search_div">
		<input type="text" id="status" />
	</div>
	<div class="search_div">
		<a id="searchBtn" style="margin-left:20px" >查询</a>
	</div>
	<div class="search_div">
		<a id="addSysRoleBtn" style="margin-left:20px;display:none" >新增</a>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		
		//状态
		$("#sysRoleSearchDiv #status").combobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "状态",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.core.common.enums.StatusEnum'
			},
			panelHeight : 100,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		$("#sysRoleSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchSysRole();
			}
		});
		$("#sysRoleSearchDiv #addSysRoleBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editSysRole();
			}
		});
		$("#sysRoleSearchDiv,#sysRoleSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchSysRole();
			}
		});
		function searchSysRole() {
			$("#sysRoleListTable").datagrid("load", {
				roleName : $("#sysRoleSearchDiv #roleName").textbox("getValue"),
				status : $("#sysRoleSearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

