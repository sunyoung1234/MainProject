package com.proj.main.member.dto;

public class MemBuildingElecDTO {
	
	private String buildingAddress;
	private String electricityUse;
	private String useDate;
	private String memId;
	
	public MemBuildingElecDTO() {
		super();
	}

	public MemBuildingElecDTO(String buildingAddress, String electricityUse, String useDate, String memId) {
		super();
		this.buildingAddress = buildingAddress;
		this.electricityUse = electricityUse;
		this.useDate = useDate;
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "MemBuildingElecDTO [buildingAddress=" + buildingAddress + ", electricityUse=" + electricityUse
				+ ", useDate=" + useDate + ", memId=" + memId + "]";
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

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	

}
