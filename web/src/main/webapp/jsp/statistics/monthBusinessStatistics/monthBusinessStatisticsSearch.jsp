<%@page import="com.base.common.enums.StatisticsTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div id="monthBusinessStatisticsSearchDiv" class="search_text">
	<div>
		<input type="text" id="statisticsType" />
		<input type="text" id="storeId" />
		<span id="queryCondition"></span>
		<a id="searchBtn" style="margin-left:20px" >查询</a>
		<a id="createChartsBtn" style="margin-left:20px" >生成图表</a>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		
		//统计方式
		$("#monthBusinessStatisticsSearchDiv #statisticsType").myCombobox({
			panelHeight : 100,
			prompt : "统计方式",
			width : 150,
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
				$("#monthBusinessStatisticsSearchDiv #queryCondition").empty();
				if (value === "") {
					//$("#monthBusinessStatisticsSearchDiv #queryCondition").empty();
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
					$("#monthBusinessStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
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
					$("#monthBusinessStatisticsSearchDiv #queryCondition").append(queryStartDate).append(queryEndDate);
				}
			}
		});
		
		
		//门店
		$("#monthBusinessStatisticsSearchDiv #storeId").myCombobox({
			textField : "storeName",
			valueField : "id",
			url : "<t:path/>/StoreInfoController/queryAllStoreInfo.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			prompt : "所属门店",
			width : 150,
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#monthBusinessStatisticsSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchHairDailyStatistics();
			}
		});
		
		$("#monthBusinessStatisticsSearchDiv #createChartsBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				if ($("#monthBusinessStatisticsSearchDiv #queryStartDate").val() == "" || $("#monthBusinessStatisticsSearchDiv #queryEndDate").val() == "") {
					window.top.$.messager.alert("失败", "请选择开始和结束日期", "error");
					return;
				}
				var checkResult = checkSelect();
				if (!checkResult) {
					return;
				}
				$.post("<t:path/>/HairDailyStatisticsController/selectMonthBusinessStatisticsChart.do", checkResult, function(data) {
					if (!data || data.code != 200) {
						//window.top.$.messager.alert("失败", data ? data.message : "查询失败", "error");
						return;
					}
					require.config({
						paths: {
							echarts: '<t:path/>/js/echarts'
						}
					});
					
					// 使用
					require([
						'echarts',
						'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
						'echarts/chart/line'
					], function (ec) {
						// 基于准备好的dom，初始化echarts图表
						var myChart = ec.init($("#charts").get(0));
						var option = data.data;
						// 为echarts对象加载数据 
						myChart.setOption(option); 
					});
				});
			}
		});

		$("#monthBusinessStatisticsSearchDiv,#monthBusinessStatisticsSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchHairDailyStatistics();
			}
		});
		
		function checkSelect() {
			var statisticsType = $("#monthBusinessStatisticsSearchDiv #statisticsType").combobox("getValue");
			if (!statisticsType) {
				window.top.$.messager.alert("失败", "请选择统计方式", "error");
				return;
			}
			
			var storeId = $("#monthBusinessStatisticsSearchDiv #storeId").combobox("getValue");
			if (!storeId) {
				window.top.$.messager.alert("失败", "请选择门店", "error");
				return;
			}
			return {
				statisticsType : statisticsType,
				storeId : storeId,
				queryStartDate : $("#monthBusinessStatisticsSearchDiv #queryStartDate").val(),
				queryEndDate : $("#monthBusinessStatisticsSearchDiv #queryEndDate").val(),
				type : 1
			};
		}
		
		function searchHairDailyStatistics() {
			var checkResult = checkSelect();
			if (!checkResult) {
				return;
			}
			
			$("#monthBusinessStatisticsListTable").datagrid("load", checkResult);
		}
	});
</script>

