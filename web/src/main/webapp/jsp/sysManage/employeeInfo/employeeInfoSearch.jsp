<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="employeeName" class="easyui-textbox" data-options="prompt:'员工名',width:150" />
	<input type="text" id="employeeType" />
	<input type="text" id="status" />
	<input type="text" id="queryStartDate" class="query_date" placeholder="开始时间" />
	<input type="text" id="queryEndDate" class="query_date" placeholder="结束时间" />
	<a id="searchEmployeeInfoBtn" style="margin-left:20px" >查询</a>
	<a id="addEmployeeInfoBtn" style="margin-left:20px;display:none" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//员工类型
		$("#employeeInfoSearchDiv #employeeType").myCombobox({
			prompt : "员工类型：",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'EmployeeTypeEnum'
			},
			panelHeight : 100,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//员工状态
		$("#employeeInfoSearchDiv #status").myCombobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "员工状态：",
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
		
		$("#employeeInfoSearchDiv #queryStartDate,#employeeInfoSearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		//查询
		$("#employeeInfoSearchDiv #searchEmployeeInfoBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchEmployeeInfo();
			}
		});
		
		//新增
		$("#employeeInfoSearchDiv #addEmployeeInfoBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editEmployeeInfo(0);
			}
		});
		
		//支持回车键
		$("#employeeInfoSearchDiv,#employeeInfoSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchEmployeeInfo();
			}
		});
		
		//搜索查询
		function searchEmployeeInfo() {
			$("#employeeInfoListTable").datagrid("load", {
				employeeName : $("#employeeInfoSearchDiv #employeeName").textbox("getValue"),
				//employeeCode : $("#employeeInfoSearchDiv #employeeCode").textbox("getValue"),
				employeeType : $("#employeeInfoSearchDiv #employeeType").combobox("getValue"),
				queryStartDate : $("#employeeInfoSearchDiv #queryStartDate").val(),
				queryEndDate : $("#employeeInfoSearchDiv #queryEndDate").val(),
				status : $("#employeeInfoSearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

