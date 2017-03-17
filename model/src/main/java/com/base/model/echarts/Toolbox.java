/**
 * 
 */
package com.base.model.echarts;

import java.util.Collection;

import com.google.common.collect.Lists;
import com.hp.tools.common.beans.BaseBean;

/**
 * @author huangping
 * 2016年9月28日 上午12:14:26
 */
public class Toolbox extends BaseEChartsBean {

	private static final long serialVersionUID = -6118864005369283730L;

	private Feature feature = new Feature();
	
	/**
	 * 
	 */
	public Toolbox() {
	}

	/**
	 * @param feature
	 */
	public Toolbox(Feature feature) {
		this.feature = feature;
	}

	public static class Feature extends BaseBean {

		private static final long serialVersionUID = 9037238605438136046L;
		private MagicType magicType = new MagicType();
		private Restore restore = new Restore();
		private SaveAsImage saveAsImage;
		public MagicType getMagicType() {
			return magicType;
		}
		public void setMagicType(MagicType magicType) {
			this.magicType = magicType;
		}
		public Restore getRestore() {
			return restore;
		}
		public void setRestore(Restore restore) {
			this.restore = restore;
		}
		public SaveAsImage getSaveAsImage() {
			return saveAsImage;
		}
		public void setSaveAsImage(SaveAsImage saveAsImage) {
			this.saveAsImage = saveAsImage;
		}
	}
	
	public static class MagicType extends BaseBean {

		private static final long serialVersionUID = -1695376923997026333L;
		private boolean show = true; // 是否显示
		private Collection<String> type = Lists.newArrayList("line", "bar"); // 可以展示的图表类型
		public boolean isShow() {
			return show;
		}
		public void setShow(boolean show) {
			this.show = show;
		}
		public Collection<String> getType() {
			return type;
		}
		public void setType(Collection<String> type) {
			this.type = type;
		}
	}
	
	public static class Restore extends BaseBean {

		private static final long serialVersionUID = 78242397232858707L;
		private boolean show = true;
		private String title = "还原";
		public boolean isShow() {
			return show;
		}
		public void setShow(boolean show) {
			this.show = show;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
	}
	
	public static class SaveAsImage extends BaseBean {

		private static final long serialVersionUID = 3723584839714779053L;
		private boolean show = true;
		private String type = "jpeg";
		public boolean isShow() {
			return show;
		}
		public void setShow(boolean show) {
			this.show = show;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
	}

	public Feature getFeature() {
		return feature;
	}

	public void setFeature(Feature feature) {
		this.feature = feature;
	}
	
}
