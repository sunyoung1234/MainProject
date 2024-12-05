package com.proj.main.result.dto;

public class PdfImgDTO {
	private String buildingId;
	private String image;
	public PdfImgDTO() {
		super();
	}
	public PdfImgDTO(String buildingId, String image) {
		super();
		this.buildingId = buildingId;
		this.image = image;
	}
	@Override
	public String toString() {
		return "PdfImgDTO [buildingId=" + buildingId + ", image=" + image + "]";
	}
	public String getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
