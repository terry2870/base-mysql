<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>项目运营管控平台</title>
<jsp:include page="/jsp/common/include.jsp" flush="true" />
</head>
<body class="easyui-layout" id="ff"  data-options="fit:true">
	<div data-options="region:'north'" style="height: 50px;border-style: none;overflow: hidden;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="top_bg01" style="back">
			<tr>
				<td width="20%" align="center" class="top_banner">管理后台系统</td>
				<td height="26" valign="middle"><div align="right" style="margin-right: 100px">你好，<span id="userName"></span>&nbsp;&nbsp; |&nbsp; <a href="#" id="logout">注销</a></div></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'west',iconCls:'icon-reload',split:true,title:'导航菜单',minWidth:250" style="width: 250px;">
		<div id="left">
			<jsp:include page="/jsp/index/leftMenu.jsp" flush="true">
				<jsp:param name="menuId" value="0" />
			</jsp:include>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="right">
			<div title="首页" id="homePageDiv">
				<jsp:include page="/jsp/index/homePage.jsp" flush="true" />
			</div>
		</div>
	</div>
	<script>
		$(function() {
			
			$.post("<t:path/>/LoginController/getUserInfo.do", function(data) {
				var user = data.data;
				if (!user) {
					return;
				}
				$("#userName").html(user.userName);
			});
			
			$("#logout").linkbutton({
				plain:true,
				iconCls:'icon-cancel',
				onClick : function() {
					$.messager.confirm('确认','你确定要注销登录吗?',function(f){
						if (!f) {
							return ;
						}
						window.location.href = "<t:path />/jsp/logout.jsp";
					});
				}
			});

			$("#right").myTabs({
				fit : true
			});
		});

		function addTab(item, forceClose) {
			if ($("#right").tabs("exists", item.menuName)) {
				if (forceClose === true) {
					$("#right").tabs("close", item.menuName);
					addTab(item);
					return;
				}
				$("#right").tabs("select", item.menuName);
			} else {
				var iframeId = "iframe_" + item.menuId;
				var iframe = $("<iframe>").attr({
					width : "100%",
					height : "100%",
					frameborder : 0,
					id : iframeId
				});
				if (item.menuUrl.indexOf("?") > 0) {
					iframe.attr("src", "<t:path />"+ item.menuUrl +"&menuId="+ item.menuId + "&iframeId=" + iframeId);
				} else {
					iframe.attr("src", "<t:path />"+ item.menuUrl +"?menuId="+ item.menuId + "&iframeId=" + iframeId);
				}
				$("#right").tabs("add", {
					title : item.menuName,
					content : iframe,
					closable : true,
					selected : true,
					cache : true
				});
			}
		}
	</script>
	<jsp:include page="/jsp/common/giveRight.jsp" flush="true" />
</body>
</html>

