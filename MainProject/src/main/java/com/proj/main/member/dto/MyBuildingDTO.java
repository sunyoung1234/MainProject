package com.proj.main.member.dto;

public class MyBuildingDTO {
	
	private String memId;
	private String buildingName;
	private String buildingId;
	private String roadAddress;
	private String jibunAddress;
	private String extraAddress;
	private String climate;
	private String residentialType;
	private String structureType;
	private int squareMeterArea;
	private int floors;
	private int doors;
	private String insulationLevel;
	private String windowLevel;
	private String ventilationSystem;
	private double solarPanelKW;
	private String buildingImg;
	private String testYn;
	private String zebTestYn;
	private int zebLevel;
	
	public MyBuildingDTO() {
		super();
	}

	public MyBuildingDTO(String memId, String buildingName, String buildingId, String roadAddress, String jibunAddress,
			String extraAddress, String climate, String residentialType, String structureType, int squareMeterArea,
			int floors, int doors, String insulationLevel, String windowLevel, String ventilationSystem,
			double solarPanelKW, String buildingImg, String testYn, String zebTestYn, int zebLevel) {
		super();
		this.memId = memId;
		this.buildingName = buildingName;
		this.buildingId = buildingId;
		this.roadAddress = roadAddress;
		this.jibunAddress = jibunAddress;
		this.extraAddress = extraAddress;
		this.climate = climate;
		this.residentialType = residentialType;
		this.structureType = structureType;
		this.squareMeterArea = squareMeterArea;
		this.floors = floors;
		this.doors = doors;
		this.insulationLevel = insulationLevel;
		this.windowLevel = windowLevel;
		this.ventilationSystem = ventilationSystem;
		this.solarPanelKW = solarPanelKW;
		this.buildingImg = buildingImg;
		this.testYn = testYn;
		this.zebTestYn = zebTestYn;
		this.zebLevel = zebLevel;
	}

	@Override
	public String toString() {
		return "MyBuildingDTO [memId=" + memId + ", buildingName=" + buildingName + ", buildingId=" + buildingId
				+ ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress + ", extraAddress=" + extraAddress
				+ ", climate=" + climate + ", residentialType=" + residentialType + ", structureType=" + structureType
				+ ", squareMeterArea=" + squareMeterArea + ", floors=" + floors + ", doors=" + doors
				+ ", insulationLevel=" + insulationLevel + ", windowLevel=" + windowLevel + ", ventilationSystem="
				+ ventilationSystem + ", solarPanelKW=" + solarPanelKW + ", buildingImg=" + buildingImg + ", testYn="
				+ testYn + ", zebTestYn=" + zebTestYn + ", zebLevel=" + zebLevel + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getClimate() {
		return climate;
	}

	public void setClimate(String climate) {
		this.climate = climate;
	}

	public String getResidentialType() {
		return residentialType;
	}

	public void setResidentialType(String residentialType) {
		this.residentialType = residentialType;
	}

	public String getStructureType() {
		return structureType;
	}

	public void setStructureType(String structureType) {
		this.structureType = structureType;
	}

	public int getSquareMeterArea() {
		return squareMeterArea;
	}

	public void setSquareMeterArea(int squareMeterArea) {
		this.squareMeterArea = squareMeterArea;
	}

	public int getFloors() {
		return floors;
	}

	public void setFloors(int floors) {
		this.floors = floors;
	}

	public int getDoors() {
		return doors;
	}

	public void setDoors(int doors) {
		this.doors = doors;
	}

	public String getInsulationLevel() {
		return insulationLevel;
	}

	public void setInsulationLevel(String insulationLevel) {
		this.insulationLevel = insulationLevel;
	}

	public String getWindowLevel() {
		return windowLevel;
	}

	public void setWindowLevel(String windowLevel) {
		this.windowLevel = windowLevel;
	}

	public String getVentilationSystem() {
		return ventilationSystem;
	}

	public void setVentilationSystem(String ventilationSystem) {
		this.ventilationSystem = ventilationSystem;
	}

	public double getSolarPanelKW() {
		return solarPanelKW;
	}

	public void setSolarPanelKW(double solarPanelKW) {
		this.solarPanelKW = solarPanelKW;
	}

	public String getBuildingImg() {
		return buildingImg;
	}

	public void setBuildingImg(String buildingImg) {
		this.buildingImg = buildingImg;
	}

	public String getTestYn() {
		return testYn;
	}

	public void setTestYn(String testYn) {
		this.testYn = testYn;
	}

	public String getZebTestYn() {
		return zebTestYn;
	}

	public void setZebTestYn(String zebTestYn) {
		this.zebTestYn = zebTestYn;
	}

	public int getZebLevel() {
		return zebLevel;
	}

	public void setZebLevel(int zebLevel) {
		this.zebLevel = zebLevel;
	}

	
	
	
	
}
