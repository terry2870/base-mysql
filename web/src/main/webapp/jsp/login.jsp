<%@page import="com.base.common.enums.CodeEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<html>
<head>
<jsp:include page="/jsp/common/include.jsp" flush="true" />
<title>沙龙后台管理系统-登录</title>
</head>
<body style="overflow: hidden">
<form id="f1" method="post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="height: 100%;">
		<tr>
			<td valign="middle"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td><table width="860" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="<t:path />/images/login_03.png" width="460" height="60" /></td>
							<td><div align="right">
								<a>ENGLISH</a> &nbsp; | &nbsp; <a>帮 助</a>&nbsp; | &nbsp; <a>技术支持</a>
							</div></td>
						</tr>
					</table></td>
				</tr>
				<tr>
					<td class="login_bg"><table width="860" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="440" background="<t:path />/images/pic1.png"><table id="loginTable" width="310" border="0" align="right" cellpadding="0" cellspacing="0" style="margin-right: 20px;filter:Alpha(opacity=80)">
								<tr id="loginTitle">
									<td><img src="<t:path />/images/login_1_03.png" width="310" height="42" /></td>
								</tr>
								<tr>
									<td height="350" valign="top" background="images/login_1_05.png"><table width="250" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="36" valign="bottom">用户名：</td>
										</tr>
										<tr>										  
											<td height="40"><input name="loginName" id="loginName" type="text" class="login_input easyui-validatebox" data-options="
												required : true,
												missingMessage : '请输入登录账号名！'
											" /></td>
										</tr>
										<tr>
											<td height="36" valign="bottom">密&nbsp;&nbsp;&nbsp;码：</td>
										</tr>
										<tr>				
											<td height="40"><input name="loginPwd" id="loginPwd" type="password" class="login_input easyui-validatebox" data-options="
												required : true,
												missingMessage : '请输入登录密码！'
											" /></td>
										</tr>
										<tr>
											<td height="36">验证码：
											</td>														                                   		                                   
										</tr>
										<tr>
										    <td>
												<input id="checkCode" name="checkCode" type="text" class="login_input easyui-validatebox" maxlength="4" data-options="
													required : true,
													missingMessage : '请输入验证码',
													validType : 'length[4,4]',
													invalidMessage : '验证码长度为4个字符！'
												" />
										    </td>
										</tr>
										<tr>
											<td>
												<img src="<t:path />/jsp/checkCode.jsp" id="codeImg" align="absbottom" title="点击刷新验证码" style="cursor:pointer;">
												<a href="#" id="refeshImg">看不清楚，换个一个</a>
											</td>														                                   		                                   
										</tr>
										<tr style="display:none">
											<td height="45"><input type="checkbox" name="checkbox" id="checkbox" />自动登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="checkbox2" id="checkbox2" /> 记住密码</td>
										</tr>
										<tr>
											<td height="50" valign="bottom">
												<input type="image" src="<t:path />/images/login_1_08.png" id="submitBtn" />
											</td>
										</tr>
									</table></td>
								</tr>
								<tr>
									<td><img src="<t:path />/images/login_1_11.png" width="310" height="15" /></td>
								</tr>
							</table></td>
						</tr>
					</table></td>
				</tr>
				<tr>
					<td><table width="860" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="60" class="font_color_01">Copyright &copy;2010-2014 dinglicom.All Rights Reserved.</td>
							<td><div align="right" class="font_color_01">版权所有</div></td>
						</tr>
					</table></td>
				</tr>
			</table></td>
		</tr>
	</table>
	</form>
	<script>
	$(function() {
		$("#submitBtn").hover(
			function() {
				$(this).attr("src", "<t:path />/images/login_1_08a.png");
			},
			function() {
				$(this).attr("src", "<t:path />/images/login_1_08.png");
			}
		);
		$("#loginTable").draggable({
			handle : "#loginTitle",
			axis : "h"
		});
		$("form").form({
			url : "<t:path />/LoginController/login.do",
			onSubmit : function() {
				if (!$("form").form("validate")) {
					return false;
				}
				return true;
			},
			success : function(data) {
				if (data) {
					data = JSON.parse(data);
					if (data.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
						window.location.href = "<t:path />/jsp/index/index.jsp";
					} else {
						$.messager.alert("登录失败", data.message, "error", function() {
							refreshCode();
						});
					}
				} else {
					$.messager.alert("登录失败", data.message, "error", function() {
						refreshCode();
					});
				}
			}
		});
		
		function refreshCode() {
			$("#codeImg").attr("src", "<t:path />/jsp/checkCode.jsp?" + Math.random());
		}
		$("#codeImg,#refeshImg").click(function() {
			refreshCode();
		});
	});
</script>
</body>
</html>
