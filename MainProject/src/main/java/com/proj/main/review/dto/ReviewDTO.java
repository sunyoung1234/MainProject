package com.proj.main.review.dto;

import java.util.Date;

public class ReviewDTO {

	private String memId;
	private int revNo;
	private String revId;
	private String revDate;
	private String revTitle;
	private String revContent;
	private String revFile;
	private String revDelYn;
	private int rating;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(String memId, int revNo, String revId, String revDate, String revTitle, String revContent,
			String revFile, String revDelYn, int rating) {
		super();
		this.memId = memId;
		this.revNo = revNo;
		this.revId = revId;
		this.revDate = revDate;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revFile = revFile;
		this.revDelYn = revDelYn;
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "ReviewDTO [memId=" + memId + ", revNo=" + revNo + ", revId=" + revId + ", revDate=" + revDate
				+ ", revTitle=" + revTitle + ", revContent=" + revContent + ", revFile=" + revFile + ", revDelYn="
				+ revDelYn + ", rating=" + rating + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevId() {
		return revId;
	}

	public void setRevId(String revId) {
		this.revId = revId;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getRevFile() {
		return revFile;
	}

	public void setRevFile(String revFile) {
		this.revFile = revFile;
	}

	public String getRevDelYn() {
		return revDelYn;
	}

	public void setRevDelYn(String revDelYn) {
		this.revDelYn = revDelYn;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	
	
	
}
