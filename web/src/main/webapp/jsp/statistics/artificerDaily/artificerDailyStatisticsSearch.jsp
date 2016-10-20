<%@page import="com.base.common.enums.StatisticsTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="artificerDailyStatisticsSearchDiv" class="search_text">
	<input type="text" id="statisticsType" />
	<input type="text" id="employeeId" />
	<span id="queryCondition"></span>
	<a id="searchBtn" style="margin-left:20px" >查询</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//统计方式
		$("#artificerDailyStatisticsSearchDiv #statisticsType").myCombobox({
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
				$("#artificerDailyStatisticsSearchDiv #queryCondition").empty();
				if (value === "") {
					//$("#artificerDailyStatisticsSearchDiv #queryCondition").empty();
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
					var groupData = [
						{"value":"ei.store_id","text":"门店","query":"ei.store_id"},
						{"value":"ad.employee_id","text":"技师","query":"ad.employee_id"},
						{"value":"ad.work_date","text":"日期","query":"ad.work_date"}
					];
					
					var groupFieldsSpan = $("<span>").css({
						"margin-left" : "10px"
					});
					var groupFieldsStr = $("<input id='groupFieldsStr'>").appendTo(groupFieldsSpan);
					groupFieldsStr.myCombobox({
						data : groupData,
						multiple : true,
						panelHeight : 100,
						prompt : "分组方式",
						editable : false
					});
					$("#artificerDailyStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate).append(groupFieldsSpan);
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
					var groupData = [
						{"value":"ei.store_id","text":"门店","query":"ei.store_id"},
						{"value":"ad.employee_id","text":"技师","query":"ad.employee_id"},
						{"value":"substr(ad.work_date, 1, 7)","text":"月份","query":"substr(ad.work_date, 1, 7) work_date"}
					];
					
					var groupFieldsSpan = $("<span>").css({
						"margin-left" : "10px"
					});
					var groupFieldsStr = $("<input id='groupFieldsStr'>").appendTo(groupFieldsSpan);
					groupFieldsStr.myCombobox({
						data : groupData,
						multiple : true,
						panelHeight : 100,
						prompt : "分组方式",
						editable : false
					});
					$("#artificerDailyStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate).append(groupFieldsSpan);
				}
			}
		});
		
		
		//技师
		$("#artificerDailyStatisticsSearchDiv #employeeId").myCombobox({
			textField : "employeeName",
			valueField : "id",
			multiple : true,
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				rows : 0,
				employeeType : "<%=EmployeeTypeEnum.TECHNICIAN.getValue()%>",
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "技师",
			width : 150,
			panelHeight : 200,
			editable : true,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#artificerDailyStatisticsSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchArtificerDailyStatistics();
			}
		});

		$("#artificerDailyStatisticsSearchDiv,#artificerDailyStatisticsSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchArtificerDailyStatistics();
			}
		});
		function searchArtificerDailyStatistics() {
			var statisticsType = $("#artificerDailyStatisticsSearchDiv #statisticsType").combobox("getValue");
			
			if (!statisticsType) {
				window.top.$.messager.alert("失败", "请选择统计方式", "error");
				return;
			}
			
			var groupFieldsStr = $("#artificerDailyStatisticsSearchDiv #groupFieldsStr").combobox("getValues");
			var employeeIds = $("#artificerDailyStatisticsSearchDiv #employeeId").combobox("getValues");
			var queryFieldsArr = [];
			if (groupFieldsStr && groupFieldsStr.length > 0) {
				var allData = $("#artificerDailyStatisticsSearchDiv #groupFieldsStr").combobox("getData");
				for (var i = 0; i < groupFieldsStr.length; i++) {
					for (var j = 0; j < allData.length; j++) {
						if (groupFieldsStr[i] === allData[j].value) {
							queryFieldsArr.push(allData[j].query);
							break;
						}
					}
				}
			}
			var queryFieldsStr = queryFieldsArr.join(",");
			if (queryFieldsStr.indexOf("store_id") >= 0) {
				$("#artificerDailyStatisticsListTable").datagrid("showColumn", "storeId");
			} else {
				$("#artificerDailyStatisticsListTable").datagrid("hideColumn", "storeId");
			}
			if (queryFieldsStr.indexOf("employee_id") >= 0) {
				$("#artificerDailyStatisticsListTable").datagrid("showColumn", "employeeId");
			} else {
				$("#artificerDailyStatisticsListTable").datagrid("hideColumn", "employeeId");
			}
			if (queryFieldsStr.indexOf("work_date") >= 0) {
				$("#artificerDailyStatisticsListTable").datagrid("showColumn", "workDate");
			} else {
				$("#artificerDailyStatisticsListTable").datagrid("hideColumn", "workDate");
			}
			
			$("#artificerDailyStatisticsListTable").datagrid("load", {
				statisticsType : statisticsType,
				employeeIds : employeeIds ? employeeIds.join(",") : "",
				queryStartDate : $("#artificerDailyStatisticsSearchDiv #queryStartDate").val(),
				queryEndDate : $("#artificerDailyStatisticsSearchDiv #queryEndDate").val(),
				groupFieldsStr : groupFieldsStr ? groupFieldsStr.join(",") : "",
				queryFieldsStr : queryFieldsStr
			});
		}
	});
</script>

