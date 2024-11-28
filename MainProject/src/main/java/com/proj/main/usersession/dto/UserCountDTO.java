package com.proj.main.usersession.dto;

public class UserCountDTO {
	
	private long yesterdayUserCount;
	private long todayUserCount;
	
	public UserCountDTO() {
		super();
	}

	public UserCountDTO(long yesterdayUserCount, long todayUserCount) {
		super();
		this.yesterdayUserCount = yesterdayUserCount;
		this.todayUserCount = todayUserCount;
	}

	@Override
	public String toString() {
		return "UserCountDTO [yesterdayUserCount=" + yesterdayUserCount + ", todayUserCount=" + todayUserCount + "]";
	}

	public long getYesterdayUserCount() {
		return yesterdayUserCount;
	}

	public void setYesterdayUserCount(long yesterdayUserCount) {
		this.yesterdayUserCount = yesterdayUserCount;
	}

	public long getTodayUserCount() {
		return todayUserCount;
	}

	public void setTodayUserCount(long todayUserCount) {
		this.todayUserCount = todayUserCount;
	}

	
	
	
}
