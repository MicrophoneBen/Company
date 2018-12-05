package cn.hengxin.entity;

public class Client {

	private Integer id;
	private String clientName;
	private String clientLogoAddr;
	private String caseDescribe;
	private String caseImgAddr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientLogoAddr() {
		return clientLogoAddr;
	}
	public void setClientLogoAddr(String clientLogoAddr) {
		this.clientLogoAddr = clientLogoAddr;
	}
	public String getCaseDescribe() {
		return caseDescribe;
	}
	public void setCaseDescribe(String caseDescribe) {
		this.caseDescribe = caseDescribe;
	}
	public String getCaseImgAddr() {
		return caseImgAddr;
	}
	public void setCaseImgAddr(String caseImgAddr) {
		this.caseImgAddr = caseImgAddr;
	}
	
	@Override
	public String toString() {
		return "Case [id=" + id + ", clientName=" + clientName + ", clientLogoAddr=" + clientLogoAddr
				+ ", caseDescribe=" + caseDescribe + ", caseImgAddr=" + caseImgAddr + "]";
	}
	
	
}
