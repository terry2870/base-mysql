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
	<div region="north" title="查询条件" style="height: 70px; border-style: none">
		<jsp:include page="/jsp/statistics/artificerDaily/artificerDailyStatisticsSearch.jsp" flush="true" />
	</div>
	<div region="center" id="artificerDailyStatisticsListDiv">
		<table id="artificerDailyStatisticsListTable"></table>
	</div>
<script>

	$(function() {
		
		var columns = <%=WorkTypeEnum.getColumns()%>;
		
		$("#artificerDailyStatisticsListTable").myDatagrid({
			title : "技师统计数据列表",
			emptyMsg : "没有数据",
			fit : true,
			fitColumns : true,
			nowrap : true,
			striped : true,
			url : "<t:path />/ArtificerDailyStatisticsController/queryArtificerDailyStatistics.do",
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onBeforeLoad : function() {
				var statisticsType = $("#artificerDailyStatisticsSearchDiv #statisticsType").combobox("getValue");
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
				title : "技师名称",
				field : "employeeId",
				width : 120,
				align : "center",
				sortable : true,
				formatter : function(value, rowData) {
					return rowData.employeeName;
				}
			}, {
				title : "日期",
				field : "workDate",
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

