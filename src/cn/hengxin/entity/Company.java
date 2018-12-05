package cn.hengxin.entity;

public class Company {

	private Integer id;
	private String companyName;
	private String address;
	private String email;
	private String telephone;
	private String content;
	private String logoAddr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLogoAddr() {
		return logoAddr;
	}
	public void setLogoAddr(String logoAddr) {
		this.logoAddr = logoAddr;
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", companyName=" + companyName + ", address=" + address + ", email=" + email
				+ ", telephone=" + telephone + ", content=" + content + ", logoAddr=" + logoAddr + "]";
	}
	
	
	
}
