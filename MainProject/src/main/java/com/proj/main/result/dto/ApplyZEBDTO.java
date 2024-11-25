package com.proj.main.result.dto;

public class ApplyZEBDTO {
	
	private String memId;
	private String buildingId;
	private String buildingName;
	private String fileName;
	private String applianceOrg;
	private String applyDate;
	private String approveYn;
	private String rejectYn;
	private int zebLevel;
	
	public ApplyZEBDTO() {
		super();
	}

	public ApplyZEBDTO(String memId, String buildingId, String buildingName, String fileName, String applianceOrg,
			String applyDate, String approveYn, String rejectYn, int zebLevel) {
		super();
		this.memId = memId;
		this.buildingId = buildingId;
		this.buildingName = buildingName;
		this.fileName = fileName;
		this.applianceOrg = applianceOrg;
		this.applyDate = applyDate;
		this.approveYn = approveYn;
		this.rejectYn = rejectYn;
		this.zebLevel = zebLevel;
	}

	@Override
	public String toString() {
		return "ApplyZEBDTO [memId=" + memId + ", buildingId=" + buildingId + ", buildingName=" + buildingName
				+ ", fileName=" + fileName + ", applianceOrg=" + applianceOrg + ", applyDate=" + applyDate
				+ ", approveYn=" + approveYn + ", rejectYn=" + rejectYn + ", zebLevel=" + zebLevel + "]";
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

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
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

	public String getRejectYn() {
		return rejectYn;
	}

	public void setRejectYn(String rejectYn) {
		this.rejectYn = rejectYn;
	}

	public int getZebLevel() {
		return zebLevel;
	}

	public void setZebLevel(int zebLevel) {
		this.zebLevel = zebLevel;
	}


	
}
