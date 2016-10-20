<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="expensesDailyEditForm" id="expensesDailyEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<input type="hidden" name="amount" id="amount" value="<t:write name='amount' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">开支方式：</td>
			<td width="70%"><input name="expensesType" id="expensesType" /></td>
		</tr>
		<tr>
			<td align="right">金额（元）：</td>
			<td><input name="amountStr" id="amountStr" /></td>
		</tr>
		<tr>
			<td align="right">所属门店：</td>
			<td><input name="storeId" id="storeId" /></td>
		</tr>
		<tr>
			<td align="right">日期：</td>
			<td><input name="expensesDate" id="expensesDate" value="<t:write name='expensesDate' />" /></td>
		</tr>
		<tr>
			<td align="right">明细：</td>
			<td><input name="expensesDesc" id="expensesDesc" value="<t:write name='expensesDesc' />" class="easyui-textbox" data-options="multiline:true" /></td>
		</tr>
		<tr>
			<td align="right">状态：</td>
			<td>
				<input name="status" id="status" />
			</td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		
		//门店
		$("#expensesDailyEditForm #storeId").myCombobox({
			required : true,
			textField : "storeName",
			valueField : "id",
			url : "<t:path/>/StoreInfoController/queryAllStoreInfo.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			value : "<t:write name='storeId' />",
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		//开支方式
		$("#expensesDailyEditForm #expensesType").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='expensesType' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'ExpensesTypeEnum'
			},
			editable : false,
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
		});
		
		var amount = "<t:write name='amount' />";
		//金额
		$("#expensesDailyEditForm #amountStr").numberbox({
			required : true,
			min : 0,
			value : amount ? parseFloat(amount) / 100 : 0,
			precision : 2
		});
		
		//日期
		$("#expensesDailyEditForm #expensesDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#expensesDailyEditForm #expensesDate").validatebox({
			required : true
		});
		
		//状态
		$("#expensesDailyEditForm #status").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.tools.common.enums.StatusEnum'
			},
			panelHeight : 100,
			editable : false,
			value : "<t:write name='status' defaultValue='<%=String.valueOf(StatusEnum.OPEN.getValue())%>' />",
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
		});
		
		$("#expensesDailyEditForm").form();
	});
</script>

