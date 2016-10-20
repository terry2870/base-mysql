<%@page import="com.base.common.enums.StatisticsTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="remainStatisticsSearchDiv" class="search_text">
	<div>
		<input type="text" id="statisticsType" />
		<input type="text" id="storeId" />
		<span id="queryCondition"></span>
		<a id="searchBtn" style="margin-left:20px" >查询</a>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		
		//统计方式
		$("#remainStatisticsSearchDiv #statisticsType").myCombobox({
			panelHeight : 100,
			prompt : "统计方式",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'StatisticsTypeEnum'
			},
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onChange : function (value) {
				$("#remainStatisticsSearchDiv #queryCondition").empty();
				if (value === "") {
					//$("#remainStatisticsSearchDiv #queryCondition").empty();
				} else if (value == "<%=StatisticsTypeEnum.DAY.getValue()%>") {
					var queryStartDate = $("<input>").attr({
						id : "queryStartDate",
						placeholder : "开始日期"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy-MM-dd",
							el : this
						});
					});
					var queryEndDate = $("<input>").attr({
						id : "queryEndDate",
						placeholder : "结束日期"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy-MM-dd",
							el : this
						});
					});
					$("#remainStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
				} else if (value == "<%=StatisticsTypeEnum.MONTH.getValue()%>") {
					var queryStartDate = $("<input>").attr({
						id : "queryStartDate",
						placeholder : "开始月份"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy-MM",
							el : this
						});
					});
					var queryEndDate = $("<input>").attr({
						id : "queryEndDate",
						placeholder : "结束月份"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy-MM",
							el : this
						});
					});
					$("#remainStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
				}
			}
		});
		
		
		//门店
		$("#remainStatisticsSearchDiv #storeId").myCombobox({
			textField : "storeName",
			valueField : "id",
			url : "<t:path/>/StoreInfoController/queryAllStoreInfo.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "所属门店",
			width : 150,
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#remainStatisticsSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchHairDailyStatistics();
			}
		});

		$("#remainStatisticsSearchDiv,#remainStatisticsSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchHairDailyStatistics();
			}
		});
		function searchHairDailyStatistics() {
			var statisticsType = $("#remainStatisticsSearchDiv #statisticsType").combobox("getValue");
			if (!statisticsType) {
				window.top.$.messager.alert("失败", "请选择统计方式", "error");
				return;
			}
			
			var storeId = $("#remainStatisticsSearchDiv #storeId").combobox("getValue");
			if (!storeId) {
				window.top.$.messager.alert("失败", "请选择门店", "error");
				return;
			}
			
			$("#remainStatisticsListTable").datagrid("load", {
				statisticsType : statisticsType,
				storeId : storeId,
				queryStartDate : $("#remainStatisticsSearchDiv #queryStartDate").val(),
				queryEndDate : $("#remainStatisticsSearchDiv #queryEndDate").val()
			});
		}
	});
</script>

