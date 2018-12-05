package cn.hengxin.entity;

import java.math.BigInteger;

public class News {

	private Integer newsid;
	private String title;
	private String content;
	private Integer isShow;
	private String imgAddr;
	private String time;
	public Integer getNewsid() {
		return newsid;
	}
	public void setNewsid(Integer newsid) {
		this.newsid = newsid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getIsShow() {
		return isShow;
	}
	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}
	public String getImgAddr() {
		return imgAddr;
	}
	public void setImgAddr(String imgAddr) {
		this.imgAddr = imgAddr;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
