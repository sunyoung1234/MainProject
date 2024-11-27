package com.proj.main.usersession.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserSessionDAO {
	
	
	// 사용자가 로그인할 때 세션을 추가 (SESSION_ID는 자동 증가)
	int insertLoginUser(String memId);
	
	// 사용자가 로그아웃할 때 세션의 로그아웃 시간을 현재 시간으로 업데이트
	int updateLogoutTime(String memId);
	
	// 로그아웃 시간이 기록되면, 세션 지속 시간을 계산하여 SESSION_DURATION 컬럼에 업데이트
	int updateTimeCalc(String memId);
	
}
