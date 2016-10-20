<%@page import="com.base.common.enums.AffairTypeEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="attendanceInfoEditForm" id="attendanceInfoEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">员工名称：</td>
			<td width="70%"><input name="employeeId" id="employeeId" /></td>
		</tr>
		<tr>
			<td align="right">类型：</td>
			<td><input name="affairType" id="affairType" /></td>
		</tr>
		<tr>
			<td align="right">日期：</td>
			<td><input name="affairDate" id="affairDate" value="<t:write name='affairDate' />" /></td>
		</tr>
		<tr>
			<td align="right">时长（小时）：</td>
			<td><input name="durationHour" id="durationHour" value="<t:write name='durationHour' />" class="easyui-numberbox" data-options="required:true,min:0" /></td>
		</tr>
		<tr>
			<td align="right">备注：</td>
			<td><input name="remark" id="remark" value="<t:write name='remark' />" class="easyui-textbox" data-options="multiline:true" /></td>
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
		
		//员工
		$("#attendanceInfoEditForm #employeeId").myCombobox({
			required : true,
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				status : "<%=StatusEnum.OPEN.getValue()%>",
				rows : 0
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
		$("#attendanceInfoEditForm #affairType").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='affairType' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'AffairTypeEnum'
			},
			editable : false,
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			onChange : function(newValue) {debugger
				if (newValue == "<%=AffairTypeEnum.HALF_DAY.getValue()%>") {
					$("#attendanceInfoEditForm #durationHour").numberbox("setValue", "4");
				} else {
					$("#attendanceInfoEditForm #durationHour").numberbox("setValue", "8");
				}
			}
		});
		
		$("#attendanceInfoEditForm #affairDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		$("#attendanceInfoEditForm #affairDate").validatebox({
			required : true
		});
		
		//状态
		$("#attendanceInfoEditForm #status").myCombobox({
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
		
		$("#attendanceInfoEditForm").form();
	});
</script>

