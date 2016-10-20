<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="employeeId" />
	<input type="text" id="workType" />
	<input type="text" id="status" />
	<input type="text" class="query_date" id="queryStartDate" placeholder="开始时间" />
	<input type="text" class="query_date" id="queryEndDate" placeholder="结束时间" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addArtificerDailyBtn" style="margin-left:20px;display: none" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//技师
		$("#artificerDailySearchDiv #employeeId").myCombobox({
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				employeeType : "<%=EmployeeTypeEnum.TECHNICIAN.getValue()%>",
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "技师",
			width : 150,
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		//类型
		$("#artificerDailySearchDiv #workType").combobox({
			icons : [{
				iconCls : "icon-no",
				handler : function(e) {
					$(e.data.target).combobox("clear");
				}
			}],
			prompt : "类型",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'WorkTypeEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//状态
		$("#artificerDailySearchDiv #status").myCombobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "状态",
			width : 100,
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
		
		$("#artificerDailySearchDiv #queryStartDate,#artificerDailySearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#artificerDailySearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchArtificerDaily();
			}
		});
		$("#artificerDailySearchDiv #addArtificerDailyBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editArtificerDaily(0);
			}
		});
		$("#artificerDailySearchDiv,#artificerDailySearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchArtificerDaily();
			}
		});
		function searchArtificerDaily() {
			$("#artificerDailyListTable").datagrid("load", {
				employeeId : $("#artificerDailySearchDiv #employeeId").combobox("getValue"),
				workType : $("#artificerDailySearchDiv #workType").combobox("getValue"),
				queryStartDate : $("#artificerDailySearchDiv #queryStartDate").val(),
				queryEndDate : $("#artificerDailySearchDiv #queryEndDate").val(),
				status : $("#artificerDailySearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

