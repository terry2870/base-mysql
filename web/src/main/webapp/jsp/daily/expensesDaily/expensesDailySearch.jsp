<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="expensesDailySearchDiv" class="search_text">
	<input type="text" id="expensesType" />
	<input type="text" id="status" />
	<input type="text" class="query_date" id="queryStartDate" placeholder="开始时间" />
	<input type="text" class="query_date" id="queryEndDate" placeholder="结束时间" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addExpensesDailyBtn" style="margin-left:20px;display: none" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		
		//类型
		$("#expensesDailySearchDiv #expensesType").myCombobox({
			prompt : "类型",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'ExpensesTypeEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//状态
		$("#expensesDailySearchDiv #status").myCombobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "状态",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.tools.common.enums.StatusEnum'
			},
			panelHeight : 100,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		
		$("#expensesDailySearchDiv #queryStartDate,#expensesDailySearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#expensesDailySearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchExpensesDaily();
			}
		});
		$("#expensesDailySearchDiv #addExpensesDailyBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editExpensesDaily(0);
			}
		});
		$("#expensesDailySearchDiv,#expensesDailySearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchExpensesDaily();
			}
		});
		function searchExpensesDaily() {
			$("#expensesDailyListTable").datagrid("load", {
				expensesType : $("#expensesDailySearchDiv #expensesType").combobox("getValue"),
				queryStartDate : $("#expensesDailySearchDiv #queryStartDate").val(),
				queryEndDate : $("#expensesDailySearchDiv #queryEndDate").val(),
				status : $("#expensesDailySearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

