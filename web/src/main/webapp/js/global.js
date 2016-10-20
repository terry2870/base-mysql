
var CODE_SUCCESS = 200;


$.ajaxSetup({
	cache : false,
	dataType : "json",
	type : "POST",
	complete : function(XMLHttpRequest, textStatus) {
		var status = XMLHttpRequest.status;
		var dialog = $("<div>").appendTo($(window.top.document.body));
		if (status != 200) {
			if (status == 900) {
				//数据库超时
				//$.messageAlert("错误", "查询超时了");
				window.top.$(dialog).myDialog({
					modal : true,
					width : 200,
					height : 150,
					title : "错误",
					content : "查询超时了！",
					buttons : [{
						text : "关闭",
						iconCls : "icon-no",
						handler : function() {
							window.top.$(dialog).myDialog("destroy");
						}
					}]
				});
			} else if (status == 901) {
				//session超时
				window.top.$(dialog).myDialog({
					modal : true,
					width : 200,
					height : 150,
					title : "错误",
					content : "登录超时了！",
					buttons : [{
						text : "重新登录",
						iconCls : "icon-no",
						handler : function() {
							window.top.location.href = contextPath;
						}
					}]
				});
			} else if (status == 902) {
				//没有权限
				var text = XMLHttpRequest.responseText;
				text = JSON.parse(text);
				window.top.$(dialog).myDialog({
					modal : true,
					width : 500,
					height : 250,
					title : "错误",
					content : text.message,
					buttons : [{
						text : "关闭",
						iconCls : "icon-no",
						handler : function() {
							window.top.$(dialog).myDialog("destroy");
						}
					}]
				});
			} else {
				window.top.$(dialog).myDialog({
					modal : true,
					width : 200,
					height : 150,
					title : "错误",
					content : "操作失败了！",
					buttons : [{
						text : "关闭",
						iconCls : "icon-no",
						handler : function() {
							window.top.$(dialog).myDialog("destroy");
						}
					}]
				});
			}
		} else {
			var data = XMLHttpRequest.responseJSON;
			if (!data) {
				return;
			}
			if ($.isArray(data)) {
				return;
			}
			if (data.code != 200) {
				/*window.top.$(dialog).myDialog({
					modal : true,
					width : 200,
					height : 150,
					title : "错误",
					content : data.message,
					buttons : [{
						text : "关闭",
						iconCls : "icon-no",
						handler : function() {
							window.top.$(dialog).myDialog("destroy");
						}
					}]
				});*/
			}
		}
	}
});

//通用的LoadFilter
function defaultLoadFilter(data) {
	if (!data || data.code != 200) {
		return [];
	}
	return data.data;
}

