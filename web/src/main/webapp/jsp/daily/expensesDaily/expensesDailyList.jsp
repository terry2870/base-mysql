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
		<jsp:include page="/jsp/daily/expensesDaily/expensesDailySearch.jsp" flush="true" />
	</div>
	<div region="center" id="expensesDailyListDiv">
		<table id="expensesDailyListTable"></table>
	</div>
<script>

	//新增或修改开支数据
	function editExpensesDaily(id, index) {
		var data = id === 0 ? {id:0} : $("#expensesDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		var title = data.id === 0 ? "新增开支数据" : "修改开支数据";
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : title,
			href : "<t:path />/jsp/daily/expensesDaily/expensesDailyEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveExpensesDailyBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#expensesDailyEditForm").form("submit", {
						url : "<t:path />/ExpensesDailyController/saveExpensesDaily.do",
						onSubmit : function(param) {
							if (!window.top.$("#expensesDailyEditForm").form("validate")) {
								return false;
							}
							var amount = window.top.$("#expensesDailyEditForm #amountStr").numberbox("getValue");
							if (amount) {
								window.top.$("#expensesDailyEditForm #amount").val(parseFloat(amount) * 100);
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
								$("#expensesDailyListTable").datagrid("reload");
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
	
	//查看开支详情
	function viewExpensesDaily(index) {
		var data = $("#expensesDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : "开支数据详细",
			href : "<t:path />/jsp/daily/expensesDaily/expensesDailyEdit.jsp",
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
	
	//删除开始数据
	function delExpensesDaily(id) {
		window.top.$.messager.confirm("确认", "您确定要删除该开支数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/ExpensesDailyController/deleteExpensesDaily.do", {
				id : id
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#expensesDailyListTable").datagrid("reload");
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
		$("#expensesDailyListTable").myDatagrid({
			title : "开支数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/ExpensesDailyController/queryAllExpensesDaily.do",
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			columns : [[{
				title : "开支名称",
				field : "expensesType",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.expensesTypeStr;
				}
			}, {
				title : "日期",
				field : "expensesDate",
				width : 100,
				align : "center",
				sortable : true
			}, {
				title : "金额（元）",
				field : "amount",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return parseInt(rowData.amount) / 100;
				}
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
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewExpensesDaily("+ rowIndex +");'  id='viewExpensesDailyBtn_' + "+ rowData.id +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editExpensesDaily("+ rowData.id +", "+ rowIndex +");'  id='editExpensesDailyBtn_' + "+ rowData.id +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delExpensesDaily("+ rowData.id +");'  id='delExpensesDailyBtn_' + "+ rowData.id +">删除</a>";
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

