package com.proj.main.pageLog.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class PageLogDTO {
	
	private String memId;
	private String pageName;
	private int visitCount;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp lastVisitDate;
	
	
	public PageLogDTO() {
		super();
	}


	public PageLogDTO(String memId, String pageName, int visitCount, Timestamp lastVisitDate) {
		super();
		this.memId = memId;
		this.pageName = pageName;
		this.visitCount = visitCount;
		this.lastVisitDate = lastVisitDate;
	}


	@Override
	public String toString() {
		return "PageLogDTO [memId=" + memId + ", pageName=" + pageName + ", visitCount=" + visitCount
				+ ", lastVisitDate=" + lastVisitDate + "]";
	}
	

	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getPageName() {
		return pageName;
	}


	public void setPageName(String pageName) {
		this.pageName = pageName;
	}


	public int getVisitCount() {
		return visitCount;
	}


	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}


	public Timestamp getLastVisitDate() {
		return lastVisitDate;
	}


	public void setLastVisitDate(Timestamp lastVisitDate) {
		this.lastVisitDate = lastVisitDate;
	}
	
	
	
	

}
