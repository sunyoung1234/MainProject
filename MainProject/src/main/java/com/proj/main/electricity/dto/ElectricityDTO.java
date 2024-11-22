package com.proj.main.electricity.dto;

public class ElectricityDTO {
	
	private String buildingAddress;
	private String electricityUse;
	private String useDate;
	private String predUse;
	private String memId;
	
	public ElectricityDTO() {
		super();
	}

	public ElectricityDTO(String buildingAddress, String electricityUse, String useDate, String predUse, String memId) {
		super();
		this.buildingAddress = buildingAddress;
		this.electricityUse = electricityUse;
		this.useDate = useDate;
		this.predUse = predUse;
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "ElectricityDTO [buildingAddress=" + buildingAddress + ", electricityUse=" + electricityUse
				+ ", useDate=" + useDate + ", predUse=" + predUse + ", memId=" + memId + "]";
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

	public String getPredUse() {
		return predUse;
	}

	public void setPredUse(String predUse) {
		this.predUse = predUse;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	
	

}
