package com.proj.main.buildingElec.dto;

public class BuildingDTO {
	
	private String buildingAddress;
	private String electricityUse;
	private String useDate;
	
	public BuildingDTO() {
		super();
	}
	public BuildingDTO(String buildingAddress, String electricityUse, String useDate) {
		super();
		this.buildingAddress = buildingAddress;
		this.electricityUse = electricityUse;
		this.useDate = useDate;
	}
	@Override
	public String toString() {
		return "BuildingDTO [buildingAddress=" + buildingAddress + ", electricityUse=" + electricityUse + ", useDate="
				+ useDate + "]";
	}
	public String getBuildingAddress() {
		return buildingAddress;
	}
	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}
	public String getElectricityUse() {
		return electricityUse;
	}
	public void setElectricityUse(String electricityUse) {
		this.electricityUse = electricityUse;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	
	
	
	
}
