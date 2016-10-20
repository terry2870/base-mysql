/**
 * 
 */
package com.base.common.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.base.common.constants.BaseConstant;

/**
 * @author huangping 2016年8月21日 下午11:28:26
 */
public class BaseListener implements ServletContextListener {

	static Logger log = LoggerFactory.getLogger(BaseListener.class);

	@Override
	public void contextInitialized(ServletContextEvent context) {
		log.info("enter ShopsServletContextListener");
		BaseConstant.projectRealPath = context.getServletContext().getRealPath("");
		log.info("ShopsServletContextListener success with realPath={}", BaseConstant.projectRealPath);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}
}
