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
		<ul id="regionLeft"></ul>
	</div>
	<div region="center">
		<div id="regionRight"></div>
	</div>
	
	<div id="menu" style="width:120px; display:none">
		<div data-options="iconCls:'icon-add',role:'addRoot'">新增根节点</div>
		<div data-options="iconCls:'icon-add',role:'addChild'">新增子节点</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'icon-edit',role:'edit'">修改节点</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'icon-remove',role:'del'">删除节点</div>
	</div>
<script>
	$(function() {
		$("#regionLeft").myTree({
			animate : true,
			lines : true,
			ajaxParam : {
				url : "<t:path />/SysRegionController/queryAllRegion.do",
				cache : false
			},
			idField : "regionId",
			pidField : "parentRegionId",
			textField : "regionName",
			rootPid : 0,
			onClick : function(node) {
				$("#regionRight").panel("refresh", "<t:path />/jsp/sysManage/sysRegion/sysRegionRight.jsp?" + $.param(node.attributes, true));
			},
			onContextMenu : function(e, node) {
				e.preventDefault();
				$(this).tree("select", node.target);
				$("#menu").menu("show", {
					left: e.pageX,
					top: e.pageY
				});
			}
		});
		
		$("#menu").menu({
			onClick : function(item) {
				var node = $("#regionLeft").tree("getSelected");
				var data = node.attributes;
				if (item.role === "addRoot") {
					data = {
						parentRegionId : 0
					};
					$("#regionRight").panel("refresh", "<t:path />/jsp/sysManage/sysRegion/sysRegionRight.jsp?" + $.param(data, true));
				} else if (item.role === "addChild") {
					data = {
						parentRegionId : data.regionId
					};
					$("#regionRight").panel("refresh", "<t:path />/jsp/sysManage/sysRegion/sysRegionRight.jsp?" + $.param(data, true));
				} else if (item.role === "edit") {
					$("#regionRight").panel("refresh", "<t:path />/jsp/sysManage/sysRegion/sysRegionRight.jsp?" + $.param(data, true));
				} else if (item.role === "del") {
					window.top.$.messager.confirm("确认", "您确定要删除该地区吗？", function(flag) {
						if (flag) {
							window.top.$.messager.progress({
								title : "正在执行",
								msg : "正在执行，请稍后..."
							});
							$.post("<t:path/>/SysRegionController/deleteSysregion.do", {
								regionId : data.regionId
							}, function(json) {
								window.top.$.messager.progress("close");
								if (!json || json.code != CODE_SUCCESS) {
									window.top.$.messager.alert("删除地区失败", json.message, "error");
									return;
								}
								$("#regionLeft").myTree("reload");
								$.messager.show({
									title : "提示",
									msg : "删除地区成功！"
								});
								$("#regionEditForm").form("clear");
							});
						}
					});
				}
			}
		});
		$("#regionRight").panel({
			title : "编辑地区",
			style : {
				position : "absolute"
			},
			left : 200,
			top : 50,
			width : 500,
			height : 300,
			cache : false,
			href : "<t:path />/jsp/sysManage/sysRegion/sysRegionRight.jsp"
		});
	});
</script>
</body>
</html>


