package com.proj.main.map.dto;

public class ZeroDTO {

	
	private String memId;
	private String buildingDivision;
	private String buildingUse;
	private String region;
	private String buildingAddress;
	private String latitude;
	private String longitude;
	private String buildingName;
	private String applicantOrganization;
	private int totalArea;
	private String zeroLevel;
	private String certificateDate;
	private String measureMethod;
	
	
	public ZeroDTO() {
		super();
	}
	
	
	public ZeroDTO(String memId, String buildingDivision, String buildingUse, String region,
			String buildingAddress, String latitude, String longitude, String buildingName,
			String applicantOrganization, int totalArea, String zeroLevel, String certificateDate,
			String measureMethod) {
		super();
		this.memId = memId;
		this.buildingDivision = buildingDivision;
		this.buildingUse = buildingUse;
		this.region = region;
		this.buildingAddress = buildingAddress;
		this.latitude = latitude;
		this.longitude = longitude;
		this.buildingName = buildingName;
		this.applicantOrganization = applicantOrganization;
		this.totalArea = totalArea;
		this.zeroLevel = zeroLevel;
		this.certificateDate = certificateDate;
		this.measureMethod = measureMethod;
	}
	
	
	@Override
	public String toString() {
		return "ZeroBuildingDTO [memId=" + memId + ", buildingDivision=" + buildingDivision + ", buildingUse="
				+ buildingUse + ", region=" + region + ", buildingAddress=" + buildingAddress + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", buildingName=" + buildingName + ", applicantOrganization="
				+ applicantOrganization + ", totalArea=" + totalArea + ", zeroLevel=" + zeroLevel + ", certificateDate="
				+ certificateDate + ", measureMethod=" + measureMethod + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBuildingDivision() {
		return buildingDivision;
	}
	public void setBuildingDivision(String buildingDivision) {
		this.buildingDivision = buildingDivision;
	}
	public String getBuildingUse() {
		return buildingUse;
	}
	public void setBuildingUse(String buildingUse) {
		this.buildingUse = buildingUse;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getBuildingAddress() {
		return buildingAddress;
	}
	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getApplicantOrganization() {
		return applicantOrganization;
	}
	public void setApplicantOrganization(String applicantOrganization) {
		this.applicantOrganization = applicantOrganization;
	}
	public int getTotalArea() {
		return totalArea;
	}
	public void setTotalArea(int totalArea) {
		this.totalArea = totalArea;
	}
	public String getZeroLevel() {
		return zeroLevel;
	}
	public void setZeroLevel(String zeroLevel) {
		this.zeroLevel = zeroLevel;
	}
	public String getCertificateDate() {
		return certificateDate;
	}
	public void setCertificateDate(String certificateDate) {
		this.certificateDate = certificateDate;
	}
	public String getMeasureMethod() {
		return measureMethod;
	}
	public void setMeasureMethod(String measureMethod) {
		this.measureMethod = measureMethod;
	}
	
	
}
