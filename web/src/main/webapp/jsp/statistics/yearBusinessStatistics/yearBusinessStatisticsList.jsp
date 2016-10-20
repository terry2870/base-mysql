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
		<jsp:include page="/jsp/statistics/yearBusinessStatistics/yearBusinessStatisticsSearch.jsp" flush="true" />
	</div>
	<div region="center" id="yearBusinessStatisticsListDiv">
		<table id="yearBusinessStatisticsListTable"></table>
	</div>
<script>

	$(function() {
		
		$("#yearBusinessStatisticsListTable").myDatagrid({
			title : "年营业额统计数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/HairDailyStatisticsController/queryYearBusinessStatisticsList.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onBeforeLoad : function() {
				var statisticsType = $("#yearBusinessStatisticsSearchDiv #statisticsType").combobox("getValue");
				if (!statisticsType) {
					return false;
				}
			},
			cache : false,
			pagination : false,
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
				title : "营业额",
				field : "amount1",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "日常开支",
				field : "amount2",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value, rowData) {
					return parseFloat(value) / 100;
				}
			}, {
				title : "产品开支",
				field : "amount3",
				width : 80,
				align : "center",
				sortable : true,
				formatter : function(value, rowData) {
					return parseFloat(value) / 100;
				}
			}, {
				title : "余额",
				field : "amount5",
				width : 80,
				align : "center",
				formatter : function(value, rowData) {
					return rowData.amount1 - parseFloat(rowData.amount2) / 100 - parseFloat(rowData.amount3) / 100;
				}
			}]]
		});
	});
</script>
</body>
</html>

