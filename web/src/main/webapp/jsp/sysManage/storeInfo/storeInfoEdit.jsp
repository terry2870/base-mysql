<%@page import="com.base.common.enums.EmployeeTypeEnum"%>
<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="storeInfoEditForm" id="storeInfoEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">门店名称：</td>
			<td width="70%"><input name="storeName" id="storeName" value="<t:write name='storeName' />" class="easyui-textbox" data-options="required:true" /></td>
		</tr>
		<tr>
			<td align="right">门店地址：</td>
			<td><input name="storeAddr" id="storeAddr" value="<t:write name='storeAddr' />" class="easyui-textbox" data-options="multiline:true" /></td>
		</tr>
		<tr>
			<td align="right">开店日期：</td>
			<td><input name="openDate" id="openDate" value="<t:write name='openDate' />" /></td>
		</tr>
		<tr>
			<td align="right">联系电话：</td>
			<td><input name="telephone" id="telephone" value="<t:write name='telephone' />" class="easyui-textbox" /></td>
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
		
		$("#storeInfoEditForm #openDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		$("#storeInfoEditForm #openDate").validatebox({
			required : true
		});
		
		//状态
		$("#storeInfoEditForm #status").myCombobox({
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
		
		$("#storeInfoEditForm").form();
	});
</script>

