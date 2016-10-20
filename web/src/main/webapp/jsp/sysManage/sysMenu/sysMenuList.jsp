<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>main</title>
	<jsp:include page="/jsp/common/include.jsp" flush="true" />
</head>
<body class="easyui-layout">
	<div region="west" style="width: 300px;">
		<ul id="menuLeft"></ul>
	</div>
	<div region="center">
		<div id="menuRight"></div>
	</div>
<script>
	$(function() {
		$("#menuLeft").myTree({
			animate : true,
			lines : true,
			ajaxParam : {
				url : "<t:path />/SysMenuController/queryAllSysMenu.do",
				cache : false
			},
			idField : "menuId",
			pidField : "parentMenuId",
			textField : "menuName",
			rootPid : 0,
			onClick : function(node) {
				$("#menuRight").panel("refresh", "<t:path />/jsp/sysManage/sysMenu/sysMenuEdit.jsp?" + $.param(node.attributes, true));
			}
		});
		$("#menuRight").panel({
			title : "编辑菜单",
			fit : true,
			cache : false,
			href : "<t:path />/jsp/sysManage/sysMenu/sysMenuEdit.jsp"
		});
	});
</script>
</body>
</html>

