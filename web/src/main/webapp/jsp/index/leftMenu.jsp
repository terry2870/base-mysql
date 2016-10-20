<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="t" uri="/my-tags" %>
<script>
	$(function() {
		$("#left").myAccordion({
			fit : true,
			rootPid : "<t:write name='menuId' />",
			idField : "menuId",
			pidField : "parentMenuId",
			textField : "menuName",
			ajaxParam : {
				cache : false,
				type : "POST",
				dataType : "json",
				url : "<t:path />/SysMenuController/queryUserSessionMenu.do"
			},
			onClickMenu : function(item, parent) {
				addTab(item);
			},
			loadFilter : function(data) {
				return defaultLoadFilter(data);
			}
		});
		
	});
</script>

