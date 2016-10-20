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
		<jsp:include page="/jsp/statistics/hairDaily/hairDailyStatisticsSearch.jsp" flush="true" />
	</div>
	<div region="center" id="hairDailyStatisticsListDiv">
		<table id="hairDailyStatisticsListTable"></table>
	</div>
<script>

	$(function() {
		
		var columns = <%=PayTypeEnum.getColumns()%>;
		
		$("#hairDailyStatisticsListTable").myDatagrid({
			title : "发型师统计数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : false,
			nowrap : true,
			striped : true,
			url : "<t:path />/HairDailyStatisticsController/queryHairDailyStatistics.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onBeforeLoad : function() {
				var statisticsType = $("#hairDailyStatisticsSearchDiv #statisticsType").combobox("getValue");
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
			frozenColumns : [[{
				title : "门店",
				field : "storeId",
				width : 120,
				align : "center",
				sortable : true,
				formatter : function(value, rowData) {
					return rowData.storeName;
				}
			}, {
				title : "发型师名称",
				field : "employeeId",
				width : 120,
				align : "center",
				sortable : true,
				formatter : function(value, rowData) {
					return rowData.employeeName;
				}
			}, {
				title : "日期",
				field : "payDate",
				width : 80,
				align : "center",
				sortable : true
			}]],
			columns : [columns]
		});
	});
</script>
</body>
</html>

