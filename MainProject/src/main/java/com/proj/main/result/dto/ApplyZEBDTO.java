package com.proj.main.result.dto;

public class ApplyZEBDTO {
	
	private String memId;
	private String buildingId;
	private String fileName;
	private String applianceOrg;
	private String applyDate;
	private String approveYn;
	
	public ApplyZEBDTO() {
		super();
	}

	public ApplyZEBDTO(String memId, String buildingId, String fileName, String applianceOrg, String applyDate,
			String approveYn) {
		super();
		this.memId = memId;
		this.buildingId = buildingId;
		this.fileName = fileName;
		this.applianceOrg = applianceOrg;
		this.applyDate = applyDate;
		this.approveYn = approveYn;
	}

	@Override
	public String toString() {
		return "ApplyZEBDTO [memId=" + memId + ", buildingId=" + buildingId + ", fileName=" + fileName
				+ ", applianceOrg=" + applianceOrg + ", applyDate=" + applyDate + ", approveYn=" + approveYn + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getApplianceOrg() {
		return applianceOrg;
	}

	public void setApplianceOrg(String applianceOrg) {
		this.applianceOrg = applianceOrg;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getApproveYn() {
		return approveYn;
	}

	public void setApproveYn(String approveYn) {
		this.approveYn = approveYn;
	}

	
	
	
	
	
	

}
