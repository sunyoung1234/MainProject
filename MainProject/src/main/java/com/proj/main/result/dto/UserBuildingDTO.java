package com.proj.main.result.dto;

public class UserBuildingDTO {

	private String memId;
	private String buildingName;
	private String buildingId;
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
	
	
	public UserBuildingDTO() {
		super();
	}


	public UserBuildingDTO(String memId, String buildingName, String buildingId, String climate, String residentialType,
			String structureType, int squareMeterArea, int floors, int doors, String insulationLevel,
			String windowLevel, String ventilationSystem, double solarPanelKW) {
		super();
		this.memId = memId;
		this.buildingName = buildingName;
		this.buildingId = buildingId;
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
	}


	@Override
	public String toString() {
		return "UserBuildingDTO [memId=" + memId + ", buildingName=" + buildingName + ", buildingId=" + buildingId
				+ ", climate=" + climate + ", residentialType=" + residentialType + ", structureType=" + structureType
				+ ", squareMeterArea=" + squareMeterArea + ", floors=" + floors + ", doors=" + doors
				+ ", insulationLevel=" + insulationLevel + ", windowLevel=" + windowLevel + ", ventilationSystem="
				+ ventilationSystem + ", solarPanelKW=" + solarPanelKW + "]";
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


	
	


	
	
	
	
	
}
