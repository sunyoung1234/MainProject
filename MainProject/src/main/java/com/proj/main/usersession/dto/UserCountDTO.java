package com.proj.main.usersession.dto;

public class UserCountDTO {
	
	private String loginDate;
	private String loginHour;
	private String loginCount;
	
	public UserCountDTO() {
		super();
	}
	
	

	public UserCountDTO(String loginDate, String loginHour, String loginCount) {
		super();
		this.loginDate = loginDate;
		this.loginHour = loginHour;
		this.loginCount = loginCount;
	}



	@Override
	public String toString() {
		return "UserCountDTO [loginDate=" + loginDate + ", loginHour=" + loginHour + ", loginCount=" + loginCount + "]";
	}



	public String getLoginDate() {
		return loginDate;
	}



	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}



	public String getLoginHour() {
		return loginHour;
	}



	public void setLoginHour(String loginHour) {
		this.loginHour = loginHour;
	}



	public String getLoginCount() {
		return loginCount;
	}



	public void setLoginCount(String loginCount) {
		this.loginCount = loginCount;
	}

	
	
	
	
}
