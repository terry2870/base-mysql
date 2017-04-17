/**
 * 
 */
package com.base.model.response;

import java.util.List;

import com.hp.tools.common.beans.BaseBean;

/**
 * @author ping.huang
 * 2017年4月17日
 */
public class QueueResponseBO extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5050679468519573334L;

	private List<Topic> topics;
	private int topicSize;
	
	public static class Topic extends BaseBean {

		/**
		 * 
		 */
		private static final long serialVersionUID = 7984332621333894747L;
		
		private String topic;
		private int queueSize;
		public String getTopic() {
			return topic;
		}
		public void setTopic(String topic) {
			this.topic = topic;
		}
		public int getQueueSize() {
			return queueSize;
		}
		public void setQueueSize(int queueSize) {
			this.queueSize = queueSize;
		}
		
	}

	public int getTopicSize() {
		return topicSize;
	}

	public void setTopicSize(int topicSize) {
		this.topicSize = topicSize;
	}

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}
}
