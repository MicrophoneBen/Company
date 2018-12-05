package cn.hengxin.entity;

public class Core {

	private Integer id;
	private String corename;
	private String keyword1;
	private String describe1;
	private String img1Addr;
	private String keyword2;
	private String describe2;
	private String img2Addr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCorename() {
		return corename;
	}
	public void setCorename(String corename) {
		this.corename = corename;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getDescribe1() {
		return describe1;
	}
	public void setDescribe1(String describe1) {
		this.describe1 = describe1;
	}
	public String getImg1Addr() {
		return img1Addr;
	}
	public void setImg1Addr(String img1Addr) {
		this.img1Addr = img1Addr;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getDescribe2() {
		return describe2;
	}
	public void setDescribe2(String describe2) {
		this.describe2 = describe2;
	}
	public String getImg2Addr() {
		return img2Addr;
	}
	public void setImg2Addr(String img2Addr) {
		this.img2Addr = img2Addr;
	}
	
	@Override
	public String toString() {
		return "Core [id=" + id + ", corename=" + corename + ", keyword1=" + keyword1 + ", describe1=" + describe1
				+ ", img1Addr=" + img1Addr + ", keyword2=" + keyword2 + ", describe2=" + describe2 + ", img2Addr="
				+ img2Addr + "]";
	}
	
	
	
}
