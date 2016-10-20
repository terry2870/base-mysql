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
	<div region="north" title="查询条件" style="height: 70px; border-style: none" id="employeeInfoSearchDiv">
		<jsp:include page="/jsp/sysManage/employeeInfo/employeeInfoSearch.jsp" flush="true" />
	</div>
	<div region="center" id="employeeInfoListDiv">
		<table id="employeeInfoListTable"></table>
	</div>
<script>

	//新增或修改员工
	function editEmployeeInfo(id, index) {
		var data = id === 0 ? {id:0} : $("#employeeInfoListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		var title = data.id === 0 ? "新增员工数据" : "修改员工数据";
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : title,
			href : "<t:path />/jsp/sysManage/employeeInfo/employeeInfoEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveEmployeeInfoBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#employeeInfoEditForm").form("submit", {
						url : "<t:path />/EmployeeInfoController/saveEmployeeInfo.do",
						onSubmit : function(param) {
							if (!window.top.$("#employeeInfoEditForm").form("validate")) {
								return false;
							}
							if (window.top.$("#employeeInfoEditForm #entryDate").val() == "") {
								window.top.$.messager.alert("失败", "请输入入职日期", "error");
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
								$("#employeeInfoListTable").datagrid("reload");
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
	
	//查看员工详情
	function viewEmployeeInfo(index) {
		var data = $("#employeeInfoListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : "员工数据详细",
			href : "<t:path />/jsp/sysManage/employeeInfo/employeeInfoEdit.jsp",
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
	
	//删除员工
	function delEmployeeInfo(id) {
		window.top.$.messager.confirm("确认", "您确定要删除该员工数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/EmployeeInfoController/deleteEmployeeInfo.do", {
				id : id
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#employeeInfoListTable").datagrid("reload");
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

	$(function() {
		$("#employeeInfoListTable").myDatagrid({
			title : "员工数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			columns : [[{
				title : "员工名称",
				field : "employeeName",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "所属门店",
				field : "storeId",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.storeName;
				}
			}, {
				title : "类型",
				field : "employeeType",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.employeeTypeStr;
				}
			}, {
				title : "入职日期",
				field : "entryDate",
				width : 100,
				align : "center",
				sortable : true
			}, {
				title : "状态",
				field : "status",
				width : 100,
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
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewEmployeeInfo("+ rowIndex +");' id='viewEmployeeInfoBtn_' + "+ rowData.id +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editEmployeeInfo("+ rowData.id +", "+ rowIndex +");' id='editEmployeeInfoBtn_' + "+ rowData.id +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delEmployeeInfo("+ rowData.id +");' id='delEmployeeInfoBtn_' + "+ rowData.id +">删除</a>";
					return str;
				}
			}]],
			cache : false,
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			idField : "userId",
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

