<%@page import="com.base.common.enums.CodeEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>

<html>
<head>
<jsp:include page="/jsp/common/include.jsp" flush="true" />
<title>登录</title>
</head>
<body style="background-color: #428bca;text-align: center;overflow: hidden;">
	<div class="login_div">
		<div>
			<img src="<t:path />/images/login_1_03.png" />
		</div>
		<div style="height:100%;background-image: url('<t:path />/images/login_1_05.png');">
			<form id="f1" method="post">
				<div>
					<input type="text" id="loginName" name="loginName" class="easyui-textbox" style="width:80%;height:40px;padding:12px" data-options="
						prompt : '登录名',
						required : true,
						iconCls : 'icon-man',
						iconWidth : 38,
						cls : 'login_input',
						missingMessage : '请输入登录账号名！'
					" />
				</div>
				<div>
					<input type="password" id="loginPwd" name="loginPwd" class="easyui-textbox" style="width:80%;height:40px;padding:12px" data-options="
						prompt : 'password',
						required : true,
						iconCls : 'icon-lock',
						iconWidth : 38,
						cls : 'login_input',
						missingMessage : '请输入登录密码！'
					" />
				</div>
				<div>
					<input type="text" id="checkCode" name="checkCode" class="easyui-textbox" style="width:80%;height:40px;padding:12px" data-options="
						prompt : '请输入验证码',
						required : true,
						cls : 'login_input',
						missingMessage : '请输入验证码',
						validType : 'length[4,4]',
						invalidMessage : '验证码长度为4个字符！'
					" />
				</div>
				<div style="margin-top: 10px;text-align: left;margin-left: 30px">
					<img src="<t:path />/jsp/checkCode.jsp" id="codeImg" title="点击刷新验证码" style="cursor:pointer;">
					<a href="#" id="refeshImg">看不清楚，换个一个</a>
				</div>
				<div style="margin-top: 10px;text-align: left;margin-left: 30px">
					<input type="image" src="<t:path />/images/login_1_08.png" id="submitBtn" />
				</div>
			</form>
		</div>
		<div>
			<img src="<t:path />/images/login_1_11.png" />
		</div>
	</div>
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
