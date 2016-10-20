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
	<div region="north" title="查询条件" style="height: 70px; border-style: none" id="attendanceInfoSearchDiv" >
		<jsp:include page="/jsp/daily/attendanceInfo/attendanceInfoSearch.jsp" flush="true" />
	</div>
	<div region="center" id="attendanceInfoListDiv">
		<table id="attendanceInfoListTable"></table>
	</div>
<script>

	//新增或修改考勤数据
	function editAttendanceInfo(id, index) {
		var data = id === 0 ? {id:0} : $("#attendanceInfoListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		var title = data.id === 0 ? "新增考勤数据" : "修改考勤数据";
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : title,
			href : "<t:path />/jsp/daily/attendanceInfo/attendanceInfoEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveAttendanceInfoBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#attendanceInfoEditForm").form("submit", {
						url : "<t:path />/AttendanceInfoController/saveAttendanceInfo.do",
						onSubmit : function(param) {
							if (!window.top.$("#attendanceInfoEditForm").form("validate")) {
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
								$("#attendanceInfoListTable").datagrid("reload");
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
	
	//查看考勤数据详情
	function viewAttendanceInfo(index) {
		var data = $("#attendanceInfoListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : "考勤数据详细",
			href : "<t:path />/jsp/daily/attendanceInfo/attendanceInfoEdit.jsp",
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
	
	//删除考勤数据
	function delAttendanceInfo(id) {
		window.top.$.messager.confirm("确认", "您确定要删除该考勤数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/AttendanceInfoController/deleteAttendanceInfo.do", {
				id : id
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#attendanceInfoListTable").datagrid("reload");
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
		$("#attendanceInfoListTable").myDatagrid({
			title : "考勤数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/AttendanceInfoController/queryAllAttendanceInfo.do",
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
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.employeeName;
				}
			}, {
				title : "日期",
				field : "affairDate",
				width : 100,
				align : "center",
				sortable : true
			}, {
				title : "类型",
				field : "affairType",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.affairTypeStr;
				}
			}, {
				title : "时长（小时）",
				field : "durationHour",
				width : 170,
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
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewAttendanceInfo("+ rowIndex +");' id='viewAttendanceInfoBtn_' + "+ rowData.id +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editAttendanceInfo("+ rowData.id +", "+ rowIndex +");' id='editAttendanceInfoBtn_' + "+ rowData.id +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delAttendanceInfo("+ rowData.id +");' id='delAttendanceInfoBtn_' + "+ rowData.id +">删除</a>";
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

