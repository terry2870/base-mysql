<%@page import="com.base.common.enums.WorkTypeEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="artificerDailyEditForm" id="artificerDailyEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">技师名称：</td>
			<td width="70%"><input name="employeeId" id="employeeId" /></td>
		</tr>
		<tr>
			<td align="right">类型：</td>
			<td><input name="workType" id="workType" /></td>
		</tr>
		<tr>
			<td align="right" id="amountTextTD">金额：</td>
			<td><input name="amount" id="amount" value="<t:write name='amount' />" class="easyui-numberbox" data-options="required:true,min:0" /></td>
		</tr>
		<tr>
			<td align="right">日期：</td>
			<td><input name="workDate" id="workDate" value="<t:write name='workDate' />" /></td>
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
		
		//技师
		$("#artificerDailyEditForm #employeeId").myCombobox({
			required : true,
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				employeeType : "<%=EmployeeTypeEnum.TECHNICIAN.getValue()%>",
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			value : "<t:write name='employeeId' />",
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		//类型
		$("#artificerDailyEditForm #workType").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='workType' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'WorkTypeEnum'
			},
			editable : false,
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onChange : function(newValue,oldValue) {
				setWorkType(newValue, 0);
			}
		});
		
		function setWorkType(workType, amount) {
			var amountValue = amount ? amount : 0;
			if (workType == "<%=WorkTypeEnum._8.getValue()%>") {
				$("#artificerDailyEditForm #amountTextTD").html("次数");
			}
			return amountValue;
		}
		
		//金额
		$("#artificerDailyEditForm #amount").numberbox({
			required : true,
			min : 0,
			value : setWorkType("<t:write name='workType' />", "<t:write name='amount' />")
		});
		
		$("#artificerDailyEditForm #workDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		$("#artificerDailyEditForm #workDate").validatebox({
			required : true
		});
		
		//状态
		$("#artificerDailyEditForm #status").myCombobox({
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
		
		$("#artificerDailyEditForm").form();
	});
</script>

