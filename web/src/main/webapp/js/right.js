
function giveRight(menuId, parentDiv) {
	if ("<%=SessionUtil.isSuperManager(user.getLoginName())%>" == "true") {
		for (var i in checkEnable) {
			if (target) {
				if (checkEnable[i]()) {
					target.$(parentDiv +" #" + i).linkbutton("enable");
				} else {
					target.$(parentDiv +" #" + i).linkbutton("disable");
					target.$(parentDiv +" #" + i).find(".l-btn-text").addClass("whiteBlack");
				}
			} else {
				if (checkEnable[i]()) {
					$(parentDiv +" #" + i).linkbutton("enable");
				} else {
					$(parentDiv +" #" + i).linkbutton("disable");
					$(parentDiv +" #" + i).find(".l-btn-text").addClass("whiteBlack");
				}
			}
		}
	} else {
		$.ajax({
			url : "<t:path />/jsp/noFilter.do",
			data : {
				method : "queryUserMenu",
				menuId : menuId
			},
			type : "POST",
			dataType : "json",
			success : function(json) {
				if (json) {
					/* for (var i in checkShow) {
						if (target) {
							if (!checkShow[i]() || !contants(json, i)) {
								target.$(parentDiv +" #" + i).hide();
							}
						} else {
							if (!checkShow[i]() || !contants(json, i)) {
								$(parentDiv +" #" + i).hide();
							}
						}
					} */
					for (var i in checkEnable) {
						if (target) {
							if (checkEnable[i]() && contants(json, i)) {
								target.$(parentDiv +" #" + i).linkbutton("enable");
							} else {
								target.$(parentDiv + " #"+ i).find(".l-btn-text").addClass("whiteBlack");
								target.$(parentDiv + " #"+ i).linkbutton("disable");
							}
						} else {
							if (checkEnable[i]() && contants(json, i)) {
								$(parentDiv +" #" + i).linkbutton("enable");
							} else {
								$(parentDiv + " #"+ i).find(".l-btn-text").addClass("whiteBlack");
								$(parentDiv + " #"+ i).linkbutton("disable");
							}
						}
					}
				}
			}
		});
	}
}