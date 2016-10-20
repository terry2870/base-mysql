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
<script src="<t:path/>/js/echarts/echarts.js"></script>
</head>
<body class="easyui-layout" fit="true">
	<div region="north" title="查询条件" style="height: 70px; border-style: none">
		<jsp:include page="/jsp/statistics/hairAchievementStatistics/hairAchievementStatisticsSearch.jsp" flush="true" />
	</div>
	<div region="center" id="hairAchievementStatisticsListDiv" class="easyui-tabs">
		<div title="列表显示">
			<table id="hairAchievementStatisticsListTable"></table>
		</div>
		<div title="图表显示" style="padding:20px;" id="charts">
		</div>
		
	</div>
<script>

	$(function() {
		
		$("#hairAchievementStatisticsListTable").myDatagrid({
			title : "发型师业绩统计数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/HairDailyStatisticsController/queryMonthBusinessStatisticsList.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onBeforeLoad : function() {
				var statisticsType = $("#hairAchievementStatisticsSearchDiv #statisticsType").combobox("getValue");
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
				title : "现金",
				field : "amount1",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "银行",
				field : "amount2",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "团购",
				field : "amount3",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "支付宝",
				field : "amount4",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "销卡",
				field : "amount6",
				width : 80,
				align : "center",
				sortable : true
			}, {
				title : "业绩总额",
				field : "amount5",
				width : 80,
				align : "center",
				formatter : function(value, rowData) {
					return rowData.amount1 + rowData.amount2 + rowData.amount3 + rowData.amount4 + rowData.amount6;
				}
			}]]
		});
	});
</script>
</body>
</html>

