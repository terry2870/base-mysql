<%@page import="com.base.common.enums.PayTypeEnum"%>
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
		<jsp:include page="/jsp/statistics/remainStatistics/remainStatisticsSearch.jsp" flush="true" />
	</div>
	<div region="center" id="remainStatisticsListDiv">
		<table id="remainStatisticsListTable"></table>
	</div>
<script>

	$(function() {
		
		$("#remainStatisticsListTable").myDatagrid({
			title : "卡金余额统计数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/HairDailyStatisticsController/queryRemainStatisticsList.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onBeforeLoad : function() {
				var statisticsType = $("#remainStatisticsSearchDiv #statisticsType").combobox("getValue");
				if (!statisticsType) {
					return false;
				}
			},
			cache : false,
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			idField : "id",
			showFooter : true,
			singleSelect : true,
			columns : [[{
				title : "日期",
				field : "payDate",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "充值",
				field : "amount1",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value) {
					if (!value) {
						return "0";
					}
					return value;
				}
			}, {
				title : "销卡",
				field : "amount2",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value) {
					if (!value) {
						return "0";
					}
					return value;
				}
			}, {
				title : "余额",
				field : "amount3",
				width : 80,
				align : "center",
				formatter : function(value, rowData) {
					return rowData.amount1 - rowData.amount2;
				}
			}]]
		});
	});
</script>
</body>
</html>

