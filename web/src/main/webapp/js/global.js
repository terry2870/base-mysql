
var CODE_SUCCESS = 200;
var contextPath = "/base-mysql";

$.ajaxSetup({
	cache : false,
	dataType : "json",
	type : "POST",
	complete : function(XMLHttpRequest, textStatus) {
		var status = XMLHttpRequest.status;
		if (status != 200) {
			if (status == 900) {
				//数据库超时
				//$.messageAlert("错误", "查询超时了");
				window.top.$.messager.alert("失败", "查询超时了！", "error");
			} else if (status == 901) {
				//session超时
				window.top.$.messager.alert("失败", "登录超时了！", "error", function() {
					window.top.location.href = contextPath;
				});
			} else {
				//没有权限
				var text = XMLHttpRequest.responseText;
				text = JSON.parse(text);
				window.top.$.messager.alert("失败", text.message, "error");
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

			}
		}
	}
});

//通用的LoadFilter
function defaultLoadFilter(data) {
	if ($.type(data) == "array") {
		return data;
	}
	if (!data) {
		return [];
	}
	if (data.code) {
		return data.data || [];
	} else {
		return data || [];
	}
}

