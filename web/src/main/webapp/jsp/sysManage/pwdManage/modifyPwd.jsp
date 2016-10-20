<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="t" uri="/my-tags" %>
<html>
<head>
	<jsp:include page="/jsp/common/include.jsp" flush="true" />
	<title>修改密码</title>
</head>
<body>
<div id="panel"></div>
<script>
	$(function() {
		$("#panel").myDialog({
			width : 400,
			height : 250,
			left : 250,
			top : 50,
			draggable : false,
			title : "修改密码",
			href : "<t:path />/jsp/sysManage/pwdManage/pwdPanel.jsp",
			cache : false,
			closable : false,
			buttons : [{
				text : "清空",
				iconCls : "icon-remove",
				handler : function() {
					$("#pwdForm").form("clear");
				}
			}, {
				id : "modifyPwdButton",
				text : "保存",
				iconCls : "icon-save",
				handler : function() {
					$("#pwdForm").submit();
				}
			}],
			onLoad : function() {
				$("#pwdForm,#pwdForm input[type='text']").keydown(function(e) {
					if (e.keyCode == 13) {
						$("#pwdForm").submit();
					}
				});
			}
		});
	});
</script>
</body>
</html>

