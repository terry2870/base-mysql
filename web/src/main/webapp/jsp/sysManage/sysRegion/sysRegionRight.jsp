<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="/my-tags" %>
<!DOCTYPE html>
<form name="regionEditForm" id="regionEditForm" method="post">
	<input type="hidden" name="parentRegionId" id="parentRegionId" value="<t:write name='parentRegionId' />" />
	<input type="hidden" name="regionId" id="regionId" value="<t:write name='regionId' />" />
	<table class="table_style" align="center">
		<tr>
			<td width="30%" align="right">地区名称：</td>
			<td width="70%">
				<input type="text" name="regionName" id="regionName" class="easyui-textbox" data-options="
					required:true,
					validType : 'checkName',
					invalidMessage : '请输入正确的地区名，地区名不能输入形如（@#$）等特殊字符'
				" />
			</td>
		</tr>
		<tr>
			<td align="right">排序：</td>
			<td>
				<input name="sortNumber" id="sortNumber" class="easyui-numberbox" data-options="min : 0,max : 1000,required : true" />
			</td>
		</tr>
		<tr style="padding-top:20px">
			<td align="center" colspan="2" id="buttons">
				<a id="saveRegion"></a>
			</td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		$("#regionEditForm").form("load", {
			regionName : "<t:write name='regionName' />",
			sortNumber : "<t:write name='sortNumber' />"
		});
		var regionId = "<t:write name='regionId' defaultValue='0' />";
		
		$("#saveRegion").linkbutton({
			text : "保存",
			iconCls : "icon-save",
			onClick : function() {
				
			}
		});
	});
	<%-- function addRegion(regionType) {
		var treeNode = $("#regionLeft").myTree("getSelected");
		var data = {
			regionId : 0,
			regionType : regionType,
			parentRegionId : regionType == "<%=RegionTypeEnum.PROVINCE.toString()%>" ? 0 : treeNode.attributes.regionId
		};
		$("#regionRight").panel("refresh", "<t:path />/jsp/sysManage/sysRegion/regionRight.jsp?" + $.param(data, true));
	};
	function delRegion() {
		if ($("#regionId").val() == "") {
			window.top.$.messager.alert("错误", "请选择一个地区", "error");
			return;
		}
		window.top.$.messager.confirm("确认", "您确定要删除该地区吗？", function(flag) {
			if (flag) {
				window.top.$.messager.progress({
					title : "正在执行",
					msg : "正在执行，请稍后...",
					interval : 500,
					text : ""
				});
				$.ajax({
					url : "<t:path />/jsp/deleteSysregion.do",
					data : {
						regionIds : "<t:write name='regionId' />"
					},
					cache : false,
					dataType : "json",
					success : function(data) {
						window.top.$.messager.progress("close");
						if (data.returnCode == "<%=ReturnCodeEnum.CODE_OK.toString()%>") {
							$('#regionLeft').myTree("reload");
							$.messager.show({
								title : "提示",
								msg : "删除地区成功！"
							});
							$("#regionEditForm").form("clear");
						} else {
							window.top.$.messager.alert("删除地区失败", data.returnInfo, "error");
						}
					}
				});
			}
		});
	};
	function saveRegion() {
		$("#regionEditForm").form("submit", {
			url : "<t:path />/jsp/saveSysRegion.do",
			onSubmit : function() {
				if (!$("#regionEditForm").form("validate")) {
					return false;
				}
				window.top.$.messager.progress({
					title : "正在执行",
					msg : "正在执行，请稍后...",
					interval : 500,
					text : ""
				});
				return true;
			},
			success : function(data) {
				window.top.$.messager.progress("close");
				if (data) {
					data = $.parseJSON(data);
					if (data.returnCode == "<%=ReturnCodeEnum.CODE_OK.toString()%>") {
						$("#regionLeft").myTree("reload");
						$.messager.show({
							title : "提示",
							msg : "保存成功！"
						});
						$("#regionEditForm").form("clear");
					} else {
						window.top.$.messager.alert("出错", data.returnInfo, "error");
					}
				} else {
					window.top.$.messager.alert("出错", data.returnInfo, "error");
				}
			}
		});
	}; --%>
</script>


