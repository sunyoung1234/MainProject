package com.proj.main.result.dto;

public class ApplyResultDTO {
	private String buildingId;
	private String approveYn;
	private String rejectReason;
	private int zebLevel;
	
	public ApplyResultDTO() {
		super();
	}
	public ApplyResultDTO(String buildingId, String approveYn, String rejectReason, int zebLevel) {
		super();
		this.buildingId = buildingId;
		this.approveYn = approveYn;
		this.rejectReason = rejectReason;
		this.zebLevel = zebLevel;
	}
	@Override
	public String toString() {
		return "ApplyResultDTO [buildingId=" + buildingId + ", approveYn=" + approveYn + ", rejectReason="
				+ rejectReason + ", zebLevel=" + zebLevel + "]";
	}
	public String getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}
	public String getApproveYn() {
		return approveYn;
	}
	public void setApproveYn(String approveYn) {
		this.approveYn = approveYn;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public int getZebLevel() {
		return zebLevel;
	}
	public void setZebLevel(int zebLevel) {
		this.zebLevel = zebLevel;
	}
	
}
