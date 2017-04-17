/**
 * 
 */
package com.base.mvc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.BlockingQueue;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.model.response.QueueResponseBO;
import com.base.model.response.QueueResponseBO.Topic;
import com.hp.tools.common.beans.Response;
import com.hp.tools.common.queue.HPQueueFactory;

/**
 * @author ping.huang
 * 2017年4月17日
 */
@Controller
@RequestMapping("/HPQueueController.do")
public class HPQueueController {

	static Logger log = LoggerFactory.getLogger(HPQueueController.class);
	
	/**
	 * 获取队列信息
	 * @param topic
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params = "method=getQueueSize")
	@ResponseBody
	public Response<QueueResponseBO> getQueueSize(String topic) throws Exception {
		log.info("enter getQueueSize with topic={}", topic);
		QueueResponseBO bo = new QueueResponseBO();
		if (StringUtils.isNotEmpty(topic)) {
			bo.setTopicSize(1);
			List<Topic> topics = new ArrayList<>(1);
			BlockingQueue<Object> q = HPQueueFactory.getInstance().getQueueMap().get(topics);
			if (q == null) {
				bo.setTopicSize(0);
				return new Response<>(bo);
			}
			Topic t = new Topic();
			t.setQueueSize(q.size());
			t.setTopic(topic);
			topics.add(t);
			bo.setTopics(topics);
		} else {
			Map<String, BlockingQueue<Object>> queueMap = HPQueueFactory.getInstance().getQueueMap();
			bo.setTopicSize(queueMap.size());
			List<Topic> topics = new ArrayList<>(bo.getTopicSize());
			Topic t = null;
			for (Entry<String, BlockingQueue<Object>> entry : queueMap.entrySet()) {
				t = new Topic();
				t.setQueueSize(entry.getValue().size());
				t.setTopic(entry.getKey());
				topics.add(t);
			}
			bo.setTopics(topics);
		}
		
		log.info("getQueueSize success. with topic={}", topic);
		return new Response<>(bo);
	}
	
}
