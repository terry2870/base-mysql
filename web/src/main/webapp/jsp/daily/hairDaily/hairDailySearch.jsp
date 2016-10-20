<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="employeeId" />
	<input type="text" id="payType" />
	<!-- <input type="text" id="groupPurchaseStar" /> -->
	<input type="text" id="status" />
	<input type="text" class="query_date" id="queryStartDate" placeholder="开始时间" />
	<input type="text" class="query_date" id="queryEndDate" placeholder="结束时间" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addHairDailyBtn" style="margin-left:20px;display:none" >新增</a>
</div>
<script type="text/javascript">
	$(function(){
		
		//发型师
		$("#hairDailySearchDiv #employeeId").myCombobox({
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				employeeType : "<%=EmployeeTypeEnum.HAIR_STYLIST.getValue()%>",
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "发型师",
			width : 150,
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		//付款方式
		$("#hairDailySearchDiv #payType").myCombobox({
			prompt : "付款方式",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'PayTypeEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//团购评价等级
		/* $("#hairDailySearchDiv #groupPurchaseStar").myCombobox({
			prompt : "团购评价",
			width : 100,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'GroupPurchaseStarEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		}); */
		
		//状态
		$("#hairDailySearchDiv #status").myCombobox({
			value : "<%=StatusEnum.OPEN.getValue()%>",
			prompt : "状态",
			labelAlign : "right",
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.tools.common.enums.StatusEnum'
			},
			width : 100,
			panelHeight : 100,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		$("#hairDailySearchDiv #queryStartDate,#hairDailySearchDiv #queryEndDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		$("#hairDailySearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchHairDaily();
			}
		});
		$("#hairDailySearchDiv #addHairDailyBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editHairDaily(0);
			}
		});
		$("#hairDailySearchDiv,#hairDailySearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchHairDaily();
			}
		});
		function searchHairDaily() {
			$("#hairDailyListTable").datagrid("load", {
				employeeId : $("#hairDailySearchDiv #employeeId").combobox("getValue"),
				payType : $("#hairDailySearchDiv #payType").combobox("getValue"),
				/* groupPurchaseStar : $("#hairDailySearchDiv #groupPurchaseStar").combobox("getValue"), */
				queryStartDate : $("#hairDailySearchDiv #queryStartDate").val(),
				queryEndDate : $("#hairDailySearchDiv #queryEndDate").val(),
				status : $("#hairDailySearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

