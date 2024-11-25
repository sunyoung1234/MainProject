package com.proj.main.product.dto;

public class ProductDTO {
	
	private String productCategory;
	private String productName;
	private String productGrade;
	private String productVolume;
	private String productBrand;
	private String productOrigin;
	private String yearUse;
	private String monthUse;
	private String hourUse;
	private String oneUse;
	private String yearMoney;
	private String productImage;
	private String productLink;
	
	
	public ProductDTO() {
		super();
	}


	public ProductDTO(String productCategory, String productName, String productGrade, String productVolume,
			String productBrand, String productOrigin, String yearUse, String monthUse, String hourUse, String oneUse,
			String yearMoney, String productImage, String productLink) {
		super();
		this.productCategory = productCategory;
		this.productName = productName;
		this.productGrade = productGrade;
		this.productVolume = productVolume;
		this.productBrand = productBrand;
		this.productOrigin = productOrigin;
		this.yearUse = yearUse;
		this.monthUse = monthUse;
		this.hourUse = hourUse;
		this.oneUse = oneUse;
		this.yearMoney = yearMoney;
		this.productImage = productImage;
		this.productLink = productLink;
	}


	@Override
	public String toString() {
		return "ProductDTO [productCategory=" + productCategory + ", productName=" + productName + ", productGrade="
				+ productGrade + ", productVolume=" + productVolume + ", productBrand=" + productBrand
				+ ", productOrigin=" + productOrigin + ", yearUse=" + yearUse + ", monthUse=" + monthUse + ", hourUse="
				+ hourUse + ", oneUse=" + oneUse + ", yearMoney=" + yearMoney + ", productImage=" + productImage
				+ ", productLink=" + productLink + "]";
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductGrade() {
		return productGrade;
	}


	public void setProductGrade(String productGrade) {
		this.productGrade = productGrade;
	}


	public String getProductVolume() {
		return productVolume;
	}


	public void setProductVolume(String productVolume) {
		this.productVolume = productVolume;
	}


	public String getProductBrand() {
		return productBrand;
	}


	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}


	public String getProductOrigin() {
		return productOrigin;
	}


	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}


	public String getYearUse() {
		return yearUse;
	}


	public void setYearUse(String yearUse) {
		this.yearUse = yearUse;
	}


	public String getMonthUse() {
		return monthUse;
	}


	public void setMonthUse(String monthUse) {
		this.monthUse = monthUse;
	}


	public String getHourUse() {
		return hourUse;
	}


	public void setHourUse(String hourUse) {
		this.hourUse = hourUse;
	}


	public String getOneUse() {
		return oneUse;
	}


	public void setOneUse(String oneUse) {
		this.oneUse = oneUse;
	}


	public String getYearMoney() {
		return yearMoney;
	}


	public void setYearMoney(String yearMoney) {
		this.yearMoney = yearMoney;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	public String getProductLink() {
		return productLink;
	}


	public void setProductLink(String productLink) {
		this.productLink = productLink;
	}


	
	
	

}
