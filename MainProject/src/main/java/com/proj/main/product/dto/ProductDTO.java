package com.proj.main.product.dto;

public class ProductDTO {
	
	private String productCategoty;
	private String productName;
	private String prodcutGrade;
	private String productVolume;
	private String productBrand;
	private String productOrigin;
	private String yearUse;
	private String monthUse;
	private String hourUse;
	private String oneUse;
	private String yearMonth;
	
	public ProductDTO(String productCategoty, String productName, String prodcutGrade, String productVolume,
			String productBrand, String productOrigin, String yearUse, String monthUse, String hourUse, String oneUse,
			String yearMonth) {
		super();
		this.productCategoty = productCategoty;
		this.productName = productName;
		this.prodcutGrade = prodcutGrade;
		this.productVolume = productVolume;
		this.productBrand = productBrand;
		this.productOrigin = productOrigin;
		this.yearUse = yearUse;
		this.monthUse = monthUse;
		this.hourUse = hourUse;
		this.oneUse = oneUse;
		this.yearMonth = yearMonth;
	}

	public ProductDTO() {
		super();
	}

	@Override
	public String toString() {
		return "ProductDTO [productCategoty=" + productCategoty + ", productName=" + productName + ", prodcutGrade="
				+ prodcutGrade + ", productVolume=" + productVolume + ", productBrand=" + productBrand
				+ ", productOrigin=" + productOrigin + ", yearUse=" + yearUse + ", monthUse=" + monthUse + ", hourUse="
				+ hourUse + ", oneUse=" + oneUse + ", yearMonth=" + yearMonth + "]";
	}

	public String getProductCategoty() {
		return productCategoty;
	}

	public void setProductCategoty(String productCategoty) {
		this.productCategoty = productCategoty;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProdcutGrade() {
		return prodcutGrade;
	}

	public void setProdcutGrade(String prodcutGrade) {
		this.prodcutGrade = prodcutGrade;
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

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	
	
	

}
