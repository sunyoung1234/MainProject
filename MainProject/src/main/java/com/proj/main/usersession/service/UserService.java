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
	
	public Integer yesterdayUserCount() {
		Integer result = dao.yesterdayUserCount();
		return result;
	}
	
	public Integer todayUserCount() {
		Integer result = dao.todayUserCount();
		return result;
	}
	
	public Integer yesterdayUserAvg() {
		Integer result = dao.yesterdayUserAvg();
		return result;
	}
	
	public Integer todayUserAvg() {
		Integer result = dao.todayUserAvg();
		return result;
	}
	
	public List<UserCountDTO> userLoginCount(String loginDate) {
		List<UserCountDTO> result = dao.userLoginCount(loginDate);
		return result;
	}
	
	public List<String> selectDate() {
		List<String> result = dao.selectDate();
		return result;
	}
	
	public List<UserCountDTO> selectAllLoginCount(){
		List<UserCountDTO> result = dao.selectAllLoginCount();
		return result;
	}
	
	public Integer selectAllUserVisit() {
		Integer result = dao.selectAllUserVisit();
		return result;
	}
	
}
