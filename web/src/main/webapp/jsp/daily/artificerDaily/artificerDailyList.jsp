<%@page import="com.base.common.enums.WorkTypeEnum"%>
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
	<div region="north" title="查询条件" style="height: 70px; border-style: none" id="artificerDailySearchDiv">
		<jsp:include page="/jsp/daily/artificerDaily/artificerDailySearch.jsp" flush="true" />
	</div>
	<div region="center" id="artificerDailyListDiv">
		<table id="artificerDailyListTable"></table>
	</div>
<script>

	///新增或修改技师数据
	function editArtificerDaily(id, index) {
		var data = id === 0 ? {id:0} : $("#artificerDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		var title = data.id === 0 ? "新增技师数据" : "修改技师数据";
		window.top.$(div).myDialog({
			width : "40%",
			height : "40%",
			title : title,
			href : "<t:path />/jsp/daily/artificerDaily/artificerDailyEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveArtificerDailyBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#artificerDailyEditForm").form("submit", {
						url : "<t:path />/ArtificerDailyController/saveArtificerDaily.do",
						onSubmit : function(param) {
							if (!window.top.$("#artificerDailyEditForm").form("validate")) {
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
								$("#artificerDailyListTable").datagrid("reload");
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
	
	//查看技师数据详情
	function viewArtificerDaily(index) {
		var data = $("#artificerDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "40%",
			height : "40%",
			title : "技师数据详细",
			href : "<t:path />/jsp/daily/artificerDaily/artificerDailyEdit.jsp",
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
	
	//删除技师数据
	function delArtificerDaily(id) {
		window.top.$.messager.confirm("确认", "您确定要删除该技师数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/ArtificerDailyController/deleteArtificerDaily.do", {
				id : id
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#artificerDailyListTable").datagrid("reload");
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
		$("#artificerDailyListTable").myDatagrid({
			title : "技师数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/ArtificerDailyController/queryAllArtificerDaily.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			sortName : "id",
			sortOrder : "desc",
			columns : [[{
				title : "技师名称",
				field : "employeeId",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.employeeName;
				}
			}, {
				title : "类型",
				field : "workType",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.workTypeStr;
				}
			}, {
				title : "金额/次数",
				field : "amount",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					if (rowData.workType == "<%=WorkTypeEnum._8.getValue()%>") {
						return value + " 次"
					} else {
						return value;
					}
				}
			}, {
				title : "日期",
				field : "workDate",
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
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewArtificerDaily("+ rowIndex +");' id='viewArtificerDailyBtn_' + "+ rowData.id +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editArtificerDaily("+ rowData.id +", "+ rowIndex +");' id='editArtificerDailyBtn_' + "+ rowData.id +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delArtificerDaily("+ rowData.id +");' id='delArtificerDailyBtn_' + "+ rowData.id +">删除</a>";
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

