<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.CodeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<jsp:include page="/jsp/common/include.jsp" flush="true" />
</head>
<body class="easyui-layout" fit="true">
	<div region="north" title="查询条件" style="height: 70px; border-style: none">
		<jsp:include page="/jsp/sysManage/sysRole/sysRoleSearch.jsp" flush="true" />
	</div>
	<div region="center" id="sysRoleListDiv">
		<table id="sysRoleListTable"></table>
	</div>
<script>

	//新增或修改角色
	function editSysRole(roleId, index) {
		var div = $("<div>").appendTo($(window.top.document.body));
		var data = roleId === 0 ? {roleId:0} : $("#sysRoleListTable").myDatagrid("getRowDataByIndex", index);
		var title = data.roleId === 0 ? "新增角色数据" : "修改角色数据";
		window.top.$(div).myDialog({
			width : 500,
			height : 350,
			title : title,
			href : "<t:path />/jsp/sysManage/sysRole/sysRoleEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveSysRoleBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#sysRoleEditForm").form("submit", {
						url : "<t:path />/SysRoleController/saveSysRole.do",
						onSubmit : function(param) {
							if (!window.top.$("#sysRoleEditForm").form("validate")) {
								return false;
							}
							window.top.$.messager.progress({
								title : "正在执行",
								msg : "正在执行，请稍后..."
							});
							return true;
						},
						success : function(data) {
							window.top.$.messager.progress("close");
							data = JSON.parse(data);
							if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
								window.top.$(div).dialog("close");
								$("#sysRoleListTable").datagrid("reload");
								window.top.$.messager.show({
									title : "提示",
									msg : title + "成功！"
								});
							} else {
								window.top.$.messager.alert("失败", data.message, "error");
							}
						}
					});
				}
			}, {
				text : "关闭",
				iconCls : "icon-cancel",
				handler : function() {
					window.top.$(div).dialog("close");
				}
			}],
			onOpen : function() {
				window.top.showButtonList("<t:write name='menuId' />", div.parent());
			}
		});
	}
	
	//查看角色详情
	function viewSysRole(index) {
		var data = $("#sysRoleListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : 500,
			height : 350,
			title : "角色数据详细",
			href : "<t:path />/jsp/sysManage/sysRole/sysRoleEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "刷新",
				iconCls : "icon-reload",
				handler : function() {
					window.top.$(div).dialog("refresh");
				}
			}, {
				text : "关闭",
				iconCls : "icon-cancel",
				handler : function() {
					window.top.$(div).dialog("close");
				}
			}]
		});
	}
	
	//删除角色
	function delSysRole(roleId) {
		window.top.$.messager.confirm("确认", "您确定要删除该角色数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/SysRoleController/deleteSysRole.do", {
				roleId : roleId
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#sysRoleListTable").datagrid("reload");
					window.top.$.messager.show({
						title : "提示",
						msg : "删除数据成功！"
					});
				} else {
					window.top.$.messager.alert("失败", data.message, "error");
				}
			});
		});
	}
	
	//分配角色菜单
	function viewRoleMenu(roleId) {
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "20%",
			height : "90%",
			title : "分配菜单",
			href : "<t:path />/jsp/sysManage/sysRole/sysRoleMenuEdit.jsp",
			method : "post",
			queryParams : {
				roleId : roleId
			},
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				disabled : true,
				id : "saveRoleMenuBtn",
				iconCls : "icon-save",
				handler : function() {
					window.top.saveRoleMenu(div);
				}
			}, {
				text : "关闭",
				iconCls : "icon-cancel",
				handler : function() {
					window.top.$(div).dialog("close");
				}
			}],
			onOpen : function() {
				window.top.showButtonList("<t:write name='menuId' />", div.parent());
			}
		});
	}

	$(function() {
		$("#sysRoleListTable").myDatagrid({
			title : "角色数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/SysRoleController/queryAllSysRole.do",
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			columns : [[{
				title : "角色名称",
				field : "roleName",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "状态",
				field : "status",
				width : 170,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.statusStr;
				}
			}, {
				title : "操作",
				field : "str",
				width : 200,
				align : "center",
				formatter : function(value, rowData, rowIndex) {
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewSysRole("+ rowIndex +");' id='viewSysRoleBtn_' + "+ rowData.roleId +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editSysRole("+ rowData.roleId +", "+ rowIndex +");' id='editSysRoleBtn_' + "+ rowData.roleId +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delSysRole("+ rowData.roleId +");' id='delSysRoleBtn_' + "+ rowData.roleId +">删除</a>";
					str += "<a role='roleMenu' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='viewRoleMenu("+ rowData.roleId +");' id='viewRoleMenuBtn_' + "+ rowData.roleId +">分配菜单</a>";
					return str;
				}
			}]],
			cache : false,
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			idField : "id",
			showFooter : true,
			singleSelect : true,
			onLoadSuccess : function(data) {
				$.parser.parse($(this).datagrid("getPanel"));
				window.top.showButtonList("<t:write name='menuId' />", $("body"), window.top.$("#<t:write name='iframeId' />").get(0).contentWindow);
			}
		});
	});
</script>
</body>
</html>

