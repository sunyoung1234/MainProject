package com.proj.main.usersession.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.usersession.dao.IUserSessionDAO;
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
	
	public UserSessionDTO selectAvgDuration(String memId) {
		UserSessionDTO result = dao.selectAvgDuration(memId);
		return result;
	}
}
