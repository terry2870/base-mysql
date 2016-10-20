<%@page import="com.base.common.enums.CodeEnum"%>
<%@page import="com.base.common.constants.BaseConstant"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags"%>
<!DOCTYPE html>
<div>
	<form name="pwdForm" id="pwdForm" method="post">
		<input type="hidden" name="loginName" id="loginName" value="<t:write name="loginName" />" />
		<table class="table_style" align="center">
			<tr>
				<td width="30%" align="right">账号：</td>
				<td width="70%"><t:write name='<%=BaseConstant.USER_SESSION%>' property="loginName" /></td>
			</tr>
			<tr>
				<td align="right">原始密码：</td>
				<td><input type="password" name="oldPwd" id="oldPwd" size="20" class="easyui-textbox" data-options="
					required : true,
					missingMessage : '请输入原始密码！'
				" /></td>
			</tr>
			<tr>
				<td align="right">新密码：</td>
				<td><input type="password" name="newPwd" id="newPwd" size="20" /></td>
			</tr>
			<tr>
				<td align="right">重复密码：</td>
				<td><input type="password" name="newPwd2" id="newPwd2" size="20" /></td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$("#pwdForm").form({
			url : "<t:path/>/SysUserController/modifyPwd.do",
			onSubmit : function() {
				if (!$("#pwdForm").form("validate")) {
					return false;
				}
				return true;
			},
			success : function(data) {
				data = JSON.parse(data);
				if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
					window.top.$.messager.alert("提示", "密码修改成功！", "info");
					$("#pwdForm").form("clear");
				} else {
					window.top.$.messager.alert("失败", data.message, "error");
				}
			}
		});
		$("#pwdForm #newPwd").textbox({
			required : true,
			validType : "length[6, 20]",
			missingMessage : '请输入新密码！'
		});
		$("#pwdForm #newPwd2").textbox({
			required : true,
			validType : "checkPwd['#pwdForm #newPwd']",
			missingMessage : '请再次输入新密码！'
		});
	});
</script>


