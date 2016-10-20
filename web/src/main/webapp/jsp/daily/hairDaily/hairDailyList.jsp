<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.CodeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<jsp:include page="/jsp/common/include.jsp" flush="true" />
<script src="<t:path/>/js/echarts/echarts.js"></script>
</head>
<body class="easyui-layout" fit="true">
	<div region="north" title="查询条件" style="height: 70px; border-style: none" id="hairDailySearchDiv">
		<jsp:include page="/jsp/daily/hairDaily/hairDailySearch.jsp" flush="true" />
	</div>
	<div region="center" id="hairDailyListDiv">
		<table id="hairDailyListTable"></table>
	</div>
<script>

	//新增或修改发型师数据
	function editHairDaily(id, index) {
		var data = id === 0 ? {id:0} : $("#hairDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		var title = data.id === 0 ? "新增发型师数据" : "修改发型师数据";
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : title,
			href : "<t:path />/jsp/daily/hairDaily/hairDailyEdit.jsp",
			method : "post",
			queryParams : data,
			modal : true,
			collapsible : true,
			cache : false,
			buttons : [{
				text : "保存",
				id : "saveHairDailyBtn",
				disabled : true,
				iconCls : "icon-save",
				handler : function() {
					window.top.$("#hairDailyEditForm").form("submit", {
						url : "<t:path />/HairDailyController/saveHairDaily.do",
						onSubmit : function(param) {
							if (!window.top.$("#hairDailyEditForm").form("validate")) {
								return false;
							}
							var payType = window.top.$("#hairDailyEditForm [name='payType']");
							var amount = window.top.$("#hairDailyEditForm [name='amount']");
							var params = [];
							for (var i = 0; i < payType.length; i++) {
								params.push({
									payType : $(payType[i]).val(),
									amount : $(amount[i]).val()
								});
							}
							param.params = JSON.stringify(params);
							
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
								$("#hairDailyListTable").datagrid("reload");
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
	
	//查看发型师数据详情
	function viewHairDaily(index) {
		var data = $("#hairDailyListTable").myDatagrid("getRowDataByIndex", index);
		var div = $("<div>").appendTo($(window.top.document.body));
		window.top.$(div).myDialog({
			width : "40%",
			height : "50%",
			title : "发型师数据详细",
			href : "<t:path />/jsp/daily/hairDaily/hairDailyEdit.jsp",
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
	
	//删除发型师数据
	function delHairDaily(id) {
		window.top.$.messager.confirm("确认", "您确定要删除该发型师数据吗？", function(flag) {
			if (!flag) {
				return;
			}
			window.top.$.messager.progress({
				title : "正在执行",
				msg : "正在执行，请稍后..."
			});
			$.post("<t:path />/HairDailyController/deleteHairDaily.do", {
				id : id
			}, function(data) {
				window.top.$.messager.progress("close");
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					$("#hairDailyListTable").datagrid("reload");
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
		$("#hairDailyListTable").myDatagrid({
			title : "发型师数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/HairDailyController/queryAllHairDaily.do",
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			sortName : "id",
			sortOrder : "desc",
			columns : [[{
				title : "发型师名称",
				field : "employeeId",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.employeeName;
				}
			}, {
				title : "付款方式",
				field : "payType",
				width : 100,
				align : "center",
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return rowData.payTypeStr;
				}
			}, {
				title : "金额（元）",
				field : "amount",
				width : 100,
				align : "center",
				sortable : true
			}, {
				title : "付款日期",
				field : "payDate",
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
					var str = "<a role='view' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-search'\" onClick='viewHairDaily("+ rowIndex +");' id='viewHairDailyBtn_' + "+ rowData.id +">查看</a>";
					str += "<a role='edit' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-edit'\" onClick='editHairDaily("+ rowData.id +", "+ rowIndex +");' id='editHairDailyBtn_' + "+ rowData.id +">修改</a>";
					str += "<a role='del' style='margin-left:10px;display:none;' class='easyui-linkbutton' data-options=\"iconCls : 'icon-remove'\" onClick='delHairDaily("+ rowData.id +");' id='delHairDailyBtn_' + "+ rowData.id +">删除</a>";
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

