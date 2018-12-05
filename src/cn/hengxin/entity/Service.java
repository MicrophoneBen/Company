package cn.hengxin.entity;

import java.lang.reflect.Field;

public class Service {

	private Integer id;
	private String servicename;
	private String servicedescribe;
	private String type;
	private String adv1;
	private String img1Addr;
	private String adv2;
	private String img2Addr;
	private String adv3;
	private String img3Addr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	public String getServicedescribe() {
		return servicedescribe;
	}
	public void setServicedescribe(String servicedescribe) {
		this.servicedescribe = servicedescribe;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdv1() {
		return adv1;
	}
	public void setAdv1(String adv1) {
		this.adv1 = adv1;
	}
	public String getImg1Addr() {
		return img1Addr;
	}
	public void setImg1Addr(String img1Addr) {
		this.img1Addr = img1Addr;
	}
	public String getAdv2() {
		return adv2;
	}
	public void setAdv2(String adv2) {
		this.adv2 = adv2;
	}
	public String getImg2Addr() {
		return img2Addr;
	}
	public void setImg2Addr(String img2Addr) {
		this.img2Addr = img2Addr;
	}
	public String getAdv3() {
		return adv3;
	}
	public void setAdv3(String adv3) {
		this.adv3 = adv3;
	}
	public String getImg3Addr() {
		return img3Addr;
	}
	public void setImg3Addr(String img3Addr) {
		this.img3Addr = img3Addr;
	}
	@Override
	public String toString() {
		return "Service [id=" + id + ", servicename=" + servicename + ", servicedescribe=" + servicedescribe + ", type="
				+ type + ", adv1=" + adv1 + ", img1Addr=" + img1Addr + ", adv2=" + adv2 + ", img2Addr=" + img2Addr
				+ ", adv3=" + adv3 + ", img3Addr=" + img3Addr + "]";
	}
	
	
	
	
	
	
}
