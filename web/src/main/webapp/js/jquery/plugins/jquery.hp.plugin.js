/**
 * 对myPlugin 进行扩展了一些工具类
 */
$.myPlugin = {
		
	/**
	 * bootstrap中的样式
	 */
	bootstrapClass : {
		DEFAULT : "default",
		PRIMARY : "primary",
		SUCCESS : "success",
		INFO : "info",
		WARNING : "warning",
		DANGER : "danger",
		LINK : "link"
	},
	/**
	 * 显示
	 * @param jq
	 * @param option
	 * @returns
	 */
	show : function(jq, option) {
		var opt = jq.data("panel");
		if (!option) {
			$(jq).show();
		} else if (option.effect === "slide") {
			$(jq).slideDown(option.speed, option.callback);
		} else if (option.effect === "fade") {
			$(jq).fadeIn(option.speed, option.callback);
		} else {
			$(jq).show(option.speed, option.callback);
		}
	},
	/**
	 * 隐藏
	 * @param jq
	 * @param option
	 * @returns
	 */
	hide : function(jq, option) {
		var opt = jq.data("panel");
		if (!option) {
			$(jq).hide();
		} else if (option.effect === "slide") {
			$(jq).slideUp(option.speed, option.callback);
		} else if (option.effect === "fade") {
			$(jq).fadeOut(option.speed, option.callback);
		} else {
			$(jq).hide(option.speed, option.callback);
		}
	}
};