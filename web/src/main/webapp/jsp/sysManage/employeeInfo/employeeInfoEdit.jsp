<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="employeeInfoEditForm" id="employeeInfoEditForm" method="post">
	<input type="hidden" name="id" id="id" value="<t:write name='id' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">员工名：</td>
			<td width="70%">
				<input name="employeeName" id="employeeName" value="<t:write name='employeeName' />" class="easyui-textbox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<td align="right">员工编号：</td>
			<td><input name="employeeCode" id="employeeCode" value="<t:write name='employeeCode' />" class="easyui-textbox" data-options="required:true" /></td>
		</tr>
		<tr>
			<td align="right">员工类型：</td>
			<td><input name="employeeType" id="employeeType" /></td>
		</tr>
		<tr>
			<td align="right">入职日期：</td>
			<td><input name="entryDate" id="entryDate" value="<t:write name='entryDate' />" /></td>
		</tr>
		<%-- <tr>
			<td align="right">员工图片：</td>
			<td id="picTD"></td>
		</tr> --%>
		<tr>
			<td align="right">所属门店：</td>
			<td><input name="storeId" id="storeId" /></td>
		</tr>
		<tr>
			<td align="right">状态：</td>
			<td><input name="status" id="status" /></td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		
		//员工类型
		$("#employeeInfoEditForm #employeeType").myCombobox({
			required : true,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'EmployeeTypeEnum'
			},
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
			value : "<t:write name='employeeType' />"
		});
		
		//状态
		$("#employeeInfoEditForm #status").myCombobox({
			required : true,
			panelHeight : 100,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.tools.common.enums.StatusEnum'
			},
			value : "<t:write name='status' defaultValue='<%=String.valueOf(StatusEnum.OPEN.getValue())%>' />",
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		//入职日期
		$("#employeeInfoEditForm #entryDate").css({
			"border-radius" : "5px"
		}).addClass("Wdate").click(function() {
			WdatePicker({
				readOnly : true,
				dateFmt : "yyyy-MM-dd",
				el : this
			});
		});
		
		//图片
		/* $("#employeeInfoEditForm #picTD").imageUpload({
			uploadInputName : "pic",
			realInputName : "pic",
			url : "",
			value : "<t:write name='pic' />",
			filterFileName : function(data) {
				if (!data || data.code != 200) {
					return {};
				}
				return "";
			}
		}); */
		
		//门店
		$("#employeeInfoEditForm #storeId").myCombobox({
			required : true,
			textField : "storeName",
			valueField : "id",
			url : "<t:path/>/StoreInfoController/queryAllStoreInfo.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			value : "<t:write name='storeId' />",
			panelHeight : 200,
			editable : false,
			loadFilter : function(data) {
				data = defaultLoadFilter(data);
				return data ? data.rows : [];
			}
		});
		
		$("#employeeInfoEditForm").form();
	});
</script>

