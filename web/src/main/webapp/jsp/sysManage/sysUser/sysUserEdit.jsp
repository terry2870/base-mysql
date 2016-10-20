<%@page import="com.hp.tools.common.enums.StatusEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<form name="userEditForm" id="userEditForm" method="post">
	<input type="hidden" name="userId" id="userId" value="<t:write name='userId' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">登录名：</td>
			<td width="70%">
				<input name="loginName" id="loginName" value="<t:write name='loginName' />" 
					class="easyui-textbox" data-options="required:true,validType:'checkLoginName',missingMessage:'登录名不能为空'" />
			</td>
		</tr>
		<tr id="passwdTr">
			<td align="right">密码：</td>
			<td><input type="password" name="loginPwd" id="loginPwd" /></td>
		</tr>
		<tr id="passwd2Tr">
			<td align="right">重复密码：</td>
			<td><input type="password" name="loginPwd2" id="loginPwd2" /></td>
		</tr>
		<tr>
			<td align="right">用户名称：</td>
			<td><input name="userName" id="userName" value="<t:write name='userName' />" class="easyui-textbox" data-options="required:true" /></td>
		</tr>
		<tr>
			<td align="right">手机号码：</td>
			<td><input name="mobile" id="mobile" value="<t:write name='mobile' />" class="easyui-textbox" data-options="validType:'checkMobile'" /></td>
		</tr>
		<tr>
			<td align="right">固定号码：</td>
			<td><input name="phoneNumber" id="phoneNumber" value="<t:write name='phoneNumber' />" class="easyui-textbox" data-options="validType:'checkPhoneNum'" /></td>
		</tr>
		<tr>
			<td align="right">电子邮箱地址：</td>
			<td><input name="email" id="email" value="<t:write name='email' />" class="easyui-textbox" data-options="required:false,validType:'email'" /></td>
		</tr>
		<tr>
			<td align="right">用户地址：</td>
			<td><input name="address" id="address" value="<t:write name='address' />" class="easyui-textbox" /></td>
		</tr>
		<tr>
			<td align="right">所属角色：</td>
			<td id="roleIdTD"></td>
		</tr>
		<tr>
			<td align="right">所属门店：</td>
			<td><input name="storeId" id="storeId" /></td>
		</tr>
		<tr>
			<td align="right">用户身份：</td>
			<td><input name="identity" id="identity" /></td>
		</tr>
		<tr>
			<td align="right">用户状态：</td>
			<td>
				<input name="status" id="status" />
			</td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		
		//门店
		$("#userEditForm #storeId").myCombobox({
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
		
		//身份
		$("#userEditForm #identity").myCombobox({
			url : "<t:path/>/NoFilterController.do",
			value : "<t:write name='identity' />",
			queryParams : {
				method : 'getEnumForSelect',
				className : 'IdentityEnum'
			},
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
		$("#userEditForm #status").myCombobox({
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
			}
		});
		
		if ("<t:write name='userId' />" == "0") {
			$("#userEditForm #loginPwd").textbox({
				required : true,
				validType : "length[6,20]",
				missingMessage : "密码不能为空!"
			});
			$("#userEditForm #loginPwd2").textbox({
				required : true,
				validType : "checkPwd['#userEditForm #loginPwd']"
			});
		} else {
			$("#userEditForm #loginName").textbox("readonly");
			$("#userEditForm #passwdTr,#passwd2Tr").hide();
		}
		$("#userEditForm").form();
	});
</script>

