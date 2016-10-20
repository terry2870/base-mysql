<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="employeeId" />
	<input type="text" id="affairType" />
	<input type="text" id="status" />
	<input type="text" class="query_date" id="queryStartDate" placeholder="开始时间" />
	<input type="text" class="query_date" id="queryEndDate" placeholder="结束时间" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addAttendanceInfoBtn" style="margin-left:20px;display: none;" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//员工
		$("#attendanceInfoSearchDiv #employeeId").myCombobox({
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "员工",
			width : 150,
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		//类型
		$("#attendanceInfoSearchDiv #affairType").myCombobox({
			prompt : "类型",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'AffairTypeEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//状态
		$("#attendanceInfoSearchDiv #status").myCombobox({
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
		
		$("#attendanceInfoSearchDiv #queryStartDate,#attendanceInfoSearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#attendanceInfoSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchAttendanceInfo();
			}
		});
		$("#attendanceInfoSearchDiv #addAttendanceInfoBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editAttendanceInfo(0);
			}
		});
		$("#attendanceInfoSearchDiv,#attendanceInfoSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchAttendanceInfo();
			}
		});
		function searchAttendanceInfo() {
			$("#attendanceInfoListTable").datagrid("load", {
				employeeId : $("#attendanceInfoSearchDiv #employeeId").combobox("getValue"),
				affairType : $("#attendanceInfoSearchDiv #affairType").combobox("getValue"),
				queryStartDate : $("#attendanceInfoSearchDiv #queryStartDate").val(),
				queryEndDate : $("#attendanceInfoSearchDiv #queryEndDate").val(),
				status : $("#attendanceInfoSearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

