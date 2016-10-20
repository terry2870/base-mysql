<%@page import="com.base.common.enums.StatisticsTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="yearBusinessStatisticsSearchDiv" class="search_text">
	<div>
		<input type="text" id="statisticsType" />
		<input type="text" id="storeId" />
		<span id="queryCondition"></span>
		<a id="searchBtn" style="margin-left:20px" >查询</a>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		
		var statisticsTypeData = [
			{"value":2,"text":"按月份"},
			{"value":3,"text":"按年份"},
		]
		
		//统计方式
		$("#yearBusinessStatisticsSearchDiv #statisticsType").myCombobox({
			panelHeight : 100,
			prompt : "统计方式",
			width : 150,
			data : statisticsTypeData,
			onChange : function (value) {
				$("#yearBusinessStatisticsSearchDiv #queryCondition").empty();
				if (value === "") {
					//$("#yearBusinessStatisticsSearchDiv #queryCondition").empty();
				}
				if (value == 2) {
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
					$("#yearBusinessStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
				} else if (value == 3) {
					var queryStartDate = $("<input>").attr({
						id : "queryStartDate",
						placeholder : "开始年份"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy",
							el : this
						});
					});
					var queryEndDate = $("<input>").attr({
						id : "queryEndDate",
						placeholder : "结束年份"
					}).css({
						"border-radius" : "5px",
						"margin-left" : "10px"
					}).addClass("query_date Wdate").click(function() {
						WdatePicker({
							readOnly : true,
							dateFmt : "yyyy",
							el : this
						});
					});
					$("#yearBusinessStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
				}
			}
		});
		
		
		//门店
		$("#yearBusinessStatisticsSearchDiv #storeId").myCombobox({
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
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#yearBusinessStatisticsSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchHairDailyStatistics();
			}
		});

		$("#yearBusinessStatisticsSearchDiv,#yearBusinessStatisticsSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchHairDailyStatistics();
			}
		});
		function searchHairDailyStatistics() {
			var statisticsType = $("#yearBusinessStatisticsSearchDiv #statisticsType").combobox("getValue");
			if (!statisticsType) {
				window.top.$.messager.alert("失败", "请选择统计方式", "error");
				return;
			}
			
			var storeId = $("#yearBusinessStatisticsSearchDiv #storeId").combobox("getValue");
			if (!storeId) {
				window.top.$.messager.alert("失败", "请选择门店", "error");
				return;
			}
			
			$("#yearBusinessStatisticsListTable").datagrid("load", {
				statisticsType : statisticsType,
				storeId : storeId,
				queryStartDate : $("#yearBusinessStatisticsSearchDiv #queryStartDate").val(),
				queryEndDate : $("#yearBusinessStatisticsSearchDiv #queryEndDate").val()
			});
		}
	});
</script>

