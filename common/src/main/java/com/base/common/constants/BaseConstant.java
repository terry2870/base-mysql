/**
 * 
 */
package com.base.common.constants;

import java.util.HashMap;
import java.util.Map;

import com.base.model.response.SysConfigResponseBO;

/**
 * @author huangping
 * 2016年8月21日 下午11:26:04
 */
public class BaseConstant {
	
	// 用户session的key
    public static final String USER_SESSION = "userSession";


    // 用户可见的菜单
    public static final String USER_MENU = "userMenu";

    // 验证码key
    public static final String CHECK_CODE = "checkCode";

    //项目的绝对路径
    public static String projectRealPath = "";
    
    //public static final String IS_SUPER_USER = "isSuperUser";
    
    //系统配置变量的map
    public static Map<String, SysConfigResponseBO> SYS_CONFIG_MAP = new HashMap<>();

}
