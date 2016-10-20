<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<div class="search_text">
	<input type="text" id="loginName" class="easyui-textbox" data-options="prompt:'登录名',width:150" />
	<input type="text" id="userName" class="easyui-textbox" data-options="prompt:'用户名',width:150" />
	<input type="text" id="storeId" />
	<!-- <input type="text" id="identity" /> -->
	<input type="text" id="status" />
	<a id="searchBtn" style="margin-left:20px" >查询</a>
	<a id="addSysUserBtn" style="margin-left:20px;display:none" >新增</a>
</div>
<div class="search_text">
	
</div>
<script type="text/javascript">
	$(function(){
		//所属门店
		$("#userSearchDiv #storeId").myCombobox({
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
		
		//类型
		/* $("#userSearchDiv #identity").myCombobox({
			prompt : "用户身份：",
			width : 150,
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'IdentityEnum'
			},
			panelHeight : 100,
			editable : false,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		}); */
		
		//状态
		$("#userSearchDiv #status").myCombobox({
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
		
		$("#userSearchDiv #searchBtn").linkbutton({
			iconCls : "icon-search",
			onClick : function() {
				searchUser();
			}
		});
		$("#userSearchDiv #addSysUserBtn").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				editSysUser(0);
			}
		});
		$("#userSearchDiv,#userSearchDiv input[type='text']").keydown(function(e) {
			if (e.keyCode == 13) {
				searchUser();
			}
		});
		function searchUser() {
			$("#userListTable").datagrid("load", {
				loginName : $("#userSearchDiv #loginName").val(),
				userName : $("#userSearchDiv #userName").val(),
				storeId : $("#userSearchDiv #storeId").combobox("getValue"),
				//identity : $("#userSearchDiv #identity").combobox("getValue"),
				status : $("#userSearchDiv #status").combobox("getValue")
			});
		}
	});
</script>

