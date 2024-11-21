package com.proj.main.proposal.dto;

import java.util.Date;

public class ProposalDTO {

	private String memId;
	private String memName;
	private int propNo;
	private String propId;
	private Date propDate;
	private String propTitle;
	private String propContent;
	private String propDelYn;
	private String propStatus;
	private String answerContent;
	public ProposalDTO() {
		super();
	}
	public ProposalDTO(String memId, String memName, int propNo, String propId, Date propDate, String propTitle,
			String propContent, String propDelYn, String propStatus, String answerContent) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.propNo = propNo;
		this.propId = propId;
		this.propDate = propDate;
		this.propTitle = propTitle;
		this.propContent = propContent;
		this.propDelYn = propDelYn;
		this.propStatus = propStatus;
		this.answerContent = answerContent;
	}
	@Override
	public String toString() {
		return "ProposalDTO [memId=" + memId + ", memName=" + memName + ", propNo=" + propNo + ", propId=" + propId
				+ ", propDate=" + propDate + ", propTitle=" + propTitle + ", propContent=" + propContent
				+ ", propDelYn=" + propDelYn + ", propStatus=" + propStatus + ", answerContent=" + answerContent + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getPropNo() {
		return propNo;
	}
	public void setPropNo(int propNo) {
		this.propNo = propNo;
	}
	public String getPropId() {
		return propId;
	}
	public void setPropId(String propId) {
		this.propId = propId;
	}
	public Date getPropDate() {
		return propDate;
	}
	public void setPropDate(Date propDate) {
		this.propDate = propDate;
	}
	public String getPropTitle() {
		return propTitle;
	}
	public void setPropTitle(String propTitle) {
		this.propTitle = propTitle;
	}
	public String getPropContent() {
		return propContent;
	}
	public void setPropContent(String propContent) {
		this.propContent = propContent;
	}
	public String getPropDelYn() {
		return propDelYn;
	}
	public void setPropDelYn(String propDelYn) {
		this.propDelYn = propDelYn;
	}
	public String getPropStatus() {
		return propStatus;
	}
	public void setPropStatus(String propStatus) {
		this.propStatus = propStatus;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	
	
	
}
