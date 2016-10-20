<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="hairDailyEditForm" id="hairDailyEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">发型师名称：</td>
			<td width="70%"><input name="employeeId" id="employeeId" /></td>
		</tr>
		<tr>
			<td align="right">付款方式：</td>
			<td id="payTypeTD"></td>
		</tr>
		<%-- <tr>
			<td align="right">付款方式：</td>
			<td><input name="payType" id="payType" /></td>
		</tr>
		<tr>
			<td align="right">金额（元）：</td>
			<td><input name="amountStr" id="amountStr" /></td>
		</tr> --%>
		<tr>
			<td align="right">付款日期：</td>
			<td><input name="payDate" id="payDate" value="<t:write name='payDate' />" /></td>
		</tr>
		<%-- <tr>
			<td align="right">团购评价等级：</td>
			<td><input name="groupPurchaseStar" id="groupPurchaseStar" /></td>
		</tr>
		<tr>
			<td align="right">团购评价内容：</td>
			<td><input name="groupPurchaseEvaluate" id="groupPurchaseEvaluate" value="<t:write name='groupPurchaseEvaluate' />" class="easyui-textbox" data-options="multiline:true" /></td>
		</tr> --%>
		<tr>
			<td align="right">状态：</td>
			<td><input name="status" id="status" /></td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		
		var id = "<t:write name='id' />";
		createPayType("<t:write name='payType' />", "<t:write name='amount' />");
		
		function createPayType(payType, amount) {
			var div = $("<div>").appendTo($("#payTypeTD"));
			var payTypeEle = $("<input>").val(payType).attr({
				name : "payType"
			}).appendTo(div);
			payTypeEle.myCombobox({
				url : "<t:path/>/NoFilterController.do",
				value : "<t:write name='payType' />",
				queryParams : {
					method : 'getEnumForSelect',
					className : 'PayTypeEnum'
				},
				editable : false,
				required : true,
				loadFilter : function(data) {
					return defaultLoadFilter(data);
				}
			});
			var amountEle = $("<input>").val(amount).attr({
				name : "amount"
			}).appendTo(div);
			amountEle.numberbox({
				width : 70,
				prompt : "金额",
				required : true,
				min : 0,
				value : amount ? amount : 0
			});
			if (id == 0) {
				var add = $("<a>").css({
					"margin-left" : "10px"
				}).linkbutton({
					iconCls : "icon-add",
					onClick : function() {
						createPayType(1, 0);
					}
				}).appendTo(div);
				var del = $("<a>").css({
					"margin-left" : "5px"
				}).linkbutton({
					iconCls : "icon-cancel",
					onClick : function() {
						if ($("#payTypeTD").find("input[name='payType']").length > 1) {
							div.remove();
						}
					}
				}).appendTo(div);
			}
			
		}
		
		//发型师
		$("#hairDailyEditForm #employeeId").myCombobox({
			required : true,
			textField : "employeeName",
			valueField : "id",
			url : "<t:path/>/EmployeeInfoController/queryAllEmployeeInfo.do",
			queryParams : {
				employeeType : "<%=EmployeeTypeEnum.HAIR_STYLIST.getValue()%>",
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
		
		$("#hairDailyEditForm #payDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		$("#hairDailyEditForm #payDate").validatebox({
			required : true
		});
		
		//团购评价
		$("#hairDailyEditForm #groupPurchaseStar").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='payType' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'GroupPurchaseStarEnum'
			},
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
		});
		
		
		//状态
		$("#hairDailyEditForm #status").myCombobox({
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
		
		$("#hairDailyEditForm").form();
	});
</script>

