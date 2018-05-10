<%@page import="com.hp.core.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="userEditForm" id="userEditForm" method="post" class="table_form">
	<input type="hidden" name="userId" id="userId" value="<t:write name='userId' />" />
	<div class="table_style">
		<input name="loginName" id="loginName" value="<t:write name='loginName'/>" class="easyui-textbox" data-options="
			required : true,
			label : '登录名：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '登录名',
			width : 300,
			validType : 'checkLoginName',
			missingMessage : '登录名不能为空'
		" />
	</div>
	<div class="table_style" id="passwdTr">
		<input type="password" name="loginPwd" id="loginPwd" />
	</div>
	<div class="table_style" id="passwd2Tr">
		<input type="password" name="loginPwd2" id="loginPwd2" />
	</div>
	<div class="table_style">
		<input name="userName" id="userName" value="<t:write name='userName'/>" class="easyui-textbox" data-options="
			required : true,
			label : '用户名称：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '用户名称',
			width : 300
		" />
	</div>
	<div class="table_style">
		<input name="mobile" id="mobile" value="<t:write name='mobile'/>" class="easyui-textbox" data-options="
			validType:'checkMobile',
			label : '手机号码：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '手机号码',
			width : 300
		" />
	</div>
	<div class="table_style">
		<input name="phoneNumber" id="phoneNumber" value="<t:write name='phoneNumber'/>" class="easyui-textbox" data-options="
			validType:'checkPhoneNum',
			label : '固定电话：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '固定电话',
			width : 300
		" />
	</div>
	<div class="table_style">
		<input name="email" id="email" value="<t:write name='email'/>" class="easyui-textbox" data-options="
			validType:'email',
			label : 'email：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : 'email',
			width : 300
		" />
	</div>
	<div class="table_style">
		<input name="address" id="address" value="<t:write name='address'/>" class="easyui-textbox" data-options="
			label : '用户地址：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '用户地址',
			width : 300
		" />
	</div>
	<div class="table_style" id="roleIdTD">
		
	</div>
	<div class="table_style">
		<input name="identity" id="identity" />
	</div>
	<div class="table_style">
		<input name="status" id="status" />
	</div>
</form>
<script>
	$(function() {
		
		//身份
		$("#userEditForm #identity").combobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='identity' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'IdentityEnum'
			},
			label : '用户身份：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '用户身份',
			width : 300,
			editable : false,
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			},
		});
		
		//角色
		$("#userEditForm #roleIdTD").checkboxList({
			textField : "roleName",
			rowMaxSize : 5,
			valueField : "roleId",
			name : "roleId",
			url : "<t:path/>/SysRoleController/queryAllSysRole.do",
			queryParams : {
				rows : 0,
				status : "<%=StatusEnum.OPEN.getValue()%>"
			},
			loadFilter : function(data) {
				if (!data || data.code != 200) {
					return [];
				}
				return data.data.rows;
			},
			onLoadSuccess : function() {
				$.post("<t:path/>/SysUserRoleController/selectByUserId.do", {
					userId : "<t:write name='userId' />"
				}, function(data) {
					if (!data || data.code != 200 || !data.data || data.data.length == 0) {
						return;
					}
					var arr = [];
					$(data.data).each(function(index, item) {
						arr.push(item.roleId);
					});
					$("#userEditForm #roleIdTD").checkboxList("setChecked", arr.join(","));
				})
			}
		});
		
		//状态
		$("#userEditForm #status").combobox({
			url : "<t:path/>/NoFilterController.do",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'com.hp.core.common.enums.StatusEnum'
			},
			label : '状态：',
			labelWidth : 100,
			cls : 'table_input',
			prompt : '状态',
			width : 300,
			panelHeight : 100,
			editable : false,
			value : "<t:write name='status' defaultValue='<%=String.valueOf(StatusEnum.OPEN.getValue())%>' />",
			required : true,
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
		if ("<t:write name='userId' />" == "0") {
			$("#userEditForm #loginPwd").textbox({
				required : true,
				label : '密码：',
				labelWidth : 100,
				cls : 'table_input',
				prompt : 'password',
				width : 300,
				validType : "length[6,20]",
				missingMessage : "密码不能为空!"
			});
			$("#userEditForm #loginPwd2").textbox({
				required : true,
				label : '重复密码：',
				labelWidth : 100,
				cls : 'table_input',
				prompt : '请再次输入密码',
				width : 300,
				validType : "checkPwd['#userEditForm #loginPwd']"
			});
		} else {
			$("#userEditForm #loginName").textbox("readonly");
			$("#userEditForm #passwdTr,#passwd2Tr").hide();
		}
		$("#userEditForm").form();
	});
</script>

