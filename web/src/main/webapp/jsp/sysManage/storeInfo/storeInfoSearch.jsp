<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="storeName" class="easyui-textbox" data-options="prompt:'门店名称',width:150" />
	<input type="text" id="status" />
	<input type="text" class="query_date" id="queryStartDate" placeholder="开始时间" />
	<input type="text" class="query_date" id="queryEndDate" placeholder="结束时间" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addStoreInfoBtn" style="margin-left:20px;display:none" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//状态
		$("#storeInfoSearchDiv #status").myCombobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "状态：",
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
		
		$("#storeInfoSearchDiv #queryStartDate,#storeInfoSearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#storeInfoSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchStoreInfo();
			}
		});
		$("#storeInfoSearchDiv #addStoreInfoBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editStoreInfo(0);
			}
		});
		$("#storeInfoSearchDiv,#storeInfoSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchStoreInfo();
			}
		});
		function searchStoreInfo() {
			$("#storeInfoListTable").datagrid("load", {
				storeName : $("#storeInfoSearchDiv #storeName").textbox("getValue"),
				queryStartDate : $("#storeInfoSearchDiv #queryStartDate").val(),
				queryEndDate : $("#storeInfoSearchDiv #queryEndDate").val(),
				status : $("#storeInfoSearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

