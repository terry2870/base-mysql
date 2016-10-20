<%@page import="com.base.common.enums.StatisticsTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="hairDailyStatisticsSearchDiv" class="search_text">
	<input type="text" id="statisticsType" />
	<input type="text" id="employeeId" />
	<span id="queryCondition"></span>
	<a id="searchBtn" style="margin-left:20px" >查询</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//统计方式
		$("#hairDailyStatisticsSearchDiv #statisticsType").myCombobox({
			panelHeight : 100,
			prompt : "统计方式",
			width : 100,
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
				$("#hairDailyStatisticsSearchDiv #queryCondition").empty();
				if (value === "") {
					//$("#hairDailyStatisticsSearchDiv #queryCondition").empty();
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
						{"value":"hd.store_id","text":"门店","query":"hd.store_id"},
						{"value":"hd.employee_id","text":"发型师","query":"hd.employee_id"},
						{"value":"hd.pay_date","text":"日期","query":"hd.pay_date"}
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
					$("#hairDailyStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate).append(groupFieldsSpan);
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
						{"value":"hd.store_id","text":"门店","query":"hd.store_id"},
						{"value":"hd.employee_id","text":"发型师","query":"hd.employee_id"},
						{"value":"substr(hd.pay_date, 1, 7)","text":"月份","query":"substr(hd.pay_date, 1, 7) pay_date"}
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
					$("#hairDailyStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate).append(groupFieldsSpan);
				}
			}
		});
		
		
		//发型师
		$("#hairDailyStatisticsSearchDiv #employeeId").myCombobox({
			textField : "employeeName",
			valueField : "id",
			multiple : true,
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				rows : 0,
				employeeType : "<%=EmployeeTypeEnum.HAIR_STYLIST.getValue()%>",
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "发型师",
			width : 150,
			panelHeight : 200,
			editable : true,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#hairDailyStatisticsSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchHairDailyStatistics();
			}
		});

		$("#hairDailyStatisticsSearchDiv,#hairDailyStatisticsSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchHairDailyStatistics();
			}
		});
		
		function checkSelect() {
			var statisticsType = $("#hairDailyStatisticsSearchDiv #statisticsType").combobox("getValue");
			
			if (!statisticsType) {
				window.top.$.messager.alert("失败", "请选择统计方式", "error");
				return;
			}
			
			var groupFieldsStr = $("#hairDailyStatisticsSearchDiv #groupFieldsStr").combobox("getValues");
			var employeeIds = $("#hairDailyStatisticsSearchDiv #employeeId").combobox("getValues");
			var queryFieldsArr = [];
			if (groupFieldsStr && groupFieldsStr.length > 0) {
				var allData = $("#hairDailyStatisticsSearchDiv #groupFieldsStr").combobox("getData");
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
				$("#hairDailyStatisticsListTable").datagrid("showColumn", "storeId");
			} else {
				$("#hairDailyStatisticsListTable").datagrid("hideColumn", "storeId");
			}
			if (queryFieldsStr.indexOf("employee_id") >= 0) {
				$("#hairDailyStatisticsListTable").datagrid("showColumn", "employeeId");
			} else {
				$("#hairDailyStatisticsListTable").datagrid("hideColumn", "employeeId");
			}
			if (queryFieldsStr.indexOf("pay_date") >= 0) {
				$("#hairDailyStatisticsListTable").datagrid("showColumn", "payDate");
			} else {
				$("#hairDailyStatisticsListTable").datagrid("hideColumn", "payDate");
			}
			return {
				statisticsType : statisticsType,
				employeeIds : employeeIds ? employeeIds.join(",") : "",
				queryStartDate : $("#hairDailyStatisticsSearchDiv #queryStartDate").val(),
				queryEndDate : $("#hairDailyStatisticsSearchDiv #queryEndDate").val(),
				groupFieldsStr : groupFieldsStr ? groupFieldsStr.join(",") : "",
				queryFieldsStr : queryFieldsStr
			};
		}
		
		function searchHairDailyStatistics() {
			var checkResult = checkSelect();
			if (!checkResult) {
				return;
			}
			
			$("#hairDailyStatisticsListTable").datagrid("load", checkResult);
		}
	});
</script>

