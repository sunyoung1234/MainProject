package com.proj.main.usersession.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.usersession.dao.IUserSessionDAO;
import com.proj.main.usersession.dto.UserCountDTO;
import com.proj.main.usersession.dto.UserSessionDTO;

@Service
public class UserService {
	
	@Autowired
	IUserSessionDAO dao;
	
	public int insertLoginUser(String memId) {
		int result = dao.insertLoginUser(memId);
		return result;
	}
	
	public int updateLogoutTime(String memId) {
		int result = dao.updateLogoutTime(memId);
		return result;
	}
	
	public int updateTimeCalc(String memId) {
		int result = dao.updateTimeCalc(memId);
		return result;
	}
	
	public List<UserSessionDTO> selectAvgDuration() {
		List<UserSessionDTO> result = dao.selectAvgDuration();
		return result;
	}
	
	public int yesterdayUserCount() {
		int result = dao.yesterdayUserCount();
		return result;
	}
	
	public int todayUserCount() {
		int result = dao.todayUserCount();
		return result;
	}
	
	public int yesterdayUserAvg() {
		int result = dao.yesterdayUserAvg();
		return result;
	}
	
	public int todayUserAvg() {
		int result = dao.todayUserAvg();
		return result;
	}
}
