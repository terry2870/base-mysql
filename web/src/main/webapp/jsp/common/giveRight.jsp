<%@ taglib prefix="t" uri="/my-tags" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>

	//列表，显示按钮
	function showButtonList(menuId, parentDiv, target) {
		$.post("<t:path/>/SysMenuController/querySessionButtonByMenuId.do", {
			menuId : menuId
		}, function(data) {
			data = defaultLoadFilter(data);
			$(data).each(function(index, item) {
				if (!item.buttonId) {
					return true;
				}
				var btn;
				if (target) {
					btn = target.$(parentDiv).find("[id^='"+ item.buttonId +"']");
					if (btn && btn.data("linkbutton")) {
						btn.linkbutton("enable");
						btn.show();
					}
				} else {
					btn = $(parentDiv).find("[id^='"+ item.buttonId +"']");
					if (btn && btn.data("linkbutton")) {
						btn.linkbutton("enable");
						btn.show();
					}
				}
			});
		});
	}
	
	//新增或修改，显示保存按钮
	function getEditPageButton(menuId) {
		
	}
	
	
	
	function contants(arr, buttonId) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].buttonId == buttonId) {
				return true;
			}
		}
		return false;
	}
</script>