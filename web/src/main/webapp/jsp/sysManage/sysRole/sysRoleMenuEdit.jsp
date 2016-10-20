<%@page import="com.base.common.enums.CodeEnum"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<ul id="roleMenuTree"></ul>
<script>
	$(function() {
		$("#roleMenuTree").myTree({
			animate : true,
			checkbox : true,
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
				if (!$("#roleMenuTree").myTree("isLeaf", node.target)) {
					$("#roleMenuTree").myTree("toggle", node.target);
				}
			},
			onLoadSuccess : function(node, data) {
				$("#roleMenuTree").myTree("expandAll");
				$.post("<t:path />/SysRoleMenuController/querySysMenuByRoleId.do", {
					roleId : "<t:write name='roleId' />"
				}, function(json) {
					if (!json || json.code != "<%=CodeEnum.SUCCESS.getCode()%>" || !json.data) {
						return;
					}
					$(json.data).each(function(i, item) {
						var t = $("#roleMenuTree").myTree("find", item.menuId);
						if (t) {
							$("#roleMenuTree").myTree("check", t.target);
						}
					});
				});
			}
		});
	});
	function saveRoleMenu(div) {
		var check = $("#roleMenuTree").myTree("getChecked");
		if (!check || check.length == 0) {
			$.messager.alert("提示", "请至少分配一个菜单！", "error");
			return;
		}
		var menuArr = [];
		$(check).each(function(i, item) {
			if ($("#roleMenuTree").myTree("isLeaf", item.target)) {
				menuArr.push(item.attributes.menuId);
			}
		});
		$.messager.progress({
			title : "正在执行",
			msg : "正在执行，请稍后..."
		});
		$.post("<t:path />/SysRoleMenuController/saveSysRoleMenu.do", {
			menuIds : menuArr.join(","),
			roleId : "<t:write name='roleId' />"
		}, function(json) {
			$.messager.progress("close");
			if (!json) {
				return;
			}
			if (json.code == "<%=CodeEnum.SUCCESS.getCode()%>") {
				$(div).dialog("close");
				$.messager.show({
					title : "提示",
					msg : "分配菜单权限成功！"
				});
			} else {
				$.messager.alert("失败", json.message, "error");
			}
		});
	}
</script>


