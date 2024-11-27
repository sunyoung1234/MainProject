package com.proj.main.usersession.dto;

import java.sql.Timestamp;
import java.time.Duration;

import org.springframework.format.annotation.DateTimeFormat;

public class UserSessionDTO {

	private int sessionId;                    // 세션 ID
    private String memId;                     // 회원 ID
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp loginTime;              // 로그인 시간
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp logoutTime;             // 로그아웃 시간
    
    private Duration sessionDuration;         // 세션 지속 시간 (Duration 타입 사용)
	
    public UserSessionDTO() {
		super();
	}

	public UserSessionDTO(int sessionId, String memId, Timestamp loginTime, Timestamp logoutTime,
			Duration sessionDuration) {
		super();
		this.sessionId = sessionId;
		this.memId = memId;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
		this.sessionDuration = sessionDuration;
	}

	@Override
	public String toString() {
		return "UserSessionDTO [sessionId=" + sessionId + ", memId=" + memId + ", loginTime=" + loginTime
				+ ", logoutTime=" + logoutTime + ", sessionDuration=" + sessionDuration + "]";
	}

	public int getSessionId() {
		return sessionId;
	}

	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public Timestamp getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(Timestamp logoutTime) {
		this.logoutTime = logoutTime;
	}

	public Duration getSessionDuration() {
		return sessionDuration;
	}

	public void setSessionDuration(Duration sessionDuration) {
		this.sessionDuration = sessionDuration;
	}
	
    
    
	
}
