package com.proj.main.result.dto;

public class TestResultDTO {
	
	private String memId;
	private String buildingId;
	private String testDate;
	private String energyGrade;
	private String energyIndependenceRate;
	private int zebGrade;
	
	public TestResultDTO() {
		super();
	}
	public TestResultDTO(String memId, String buildingId, String testDate, String energyGrade,
			String energyIndependenceRate, int zebGrade) {
		super();
		this.memId = memId;
		this.buildingId = buildingId;
		this.testDate = testDate;
		this.energyGrade = energyGrade;
		this.energyIndependenceRate = energyIndependenceRate;
		this.zebGrade = zebGrade;
	}
	@Override
	public String toString() {
		return "TestResultDTO [memId=" + memId + ", buildingId=" + buildingId + ", testDate=" + testDate
				+ ", energyGrade=" + energyGrade + ", energyIndependenceRate=" + energyIndependenceRate + ", zebGrade="
				+ zebGrade + "]";
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
	public String getTestDate() {
		return testDate;
	}
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	public String getEnergyGrade() {
		return energyGrade;
	}
	public void setEnergyGrade(String energyGrade) {
		this.energyGrade = energyGrade;
	}
	public String getEnergyIndependenceRate() {
		return energyIndependenceRate;
	}
	public void setEnergyIndependenceRate(String energyIndependenceRate) {
		this.energyIndependenceRate = energyIndependenceRate;
	}
	public int getZebGrade() {
		return zebGrade;
	}
	public void setZebGrade(int zebGrade) {
		this.zebGrade = zebGrade;
	}
	
	
}
