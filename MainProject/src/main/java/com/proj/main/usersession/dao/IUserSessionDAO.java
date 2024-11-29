package com.proj.main.usersession.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.usersession.dto.UserCountDTO;
import com.proj.main.usersession.dto.UserSessionDTO;

@Mapper
public interface IUserSessionDAO {
	
	
	// 사용자가 로그인할 때 세션을 추가 (SESSION_ID는 자동 증가)
	int insertLoginUser(String memId);
	
	// 사용자가 로그아웃할 때 세션의 로그아웃 시간을 현재 시간으로 업데이트
	int updateLogoutTime(String memId);
	
	// 로그아웃 시간이 기록되면, 세션 지속 시간을 계산하여 SESSION_DURATION 컬럼에 업데이트
	int updateTimeCalc(String memId);
	
	// 멤버별 평균 접속시간
	List<UserSessionDTO> selectAvgDuration();
	
	// 어제 접속자 수(중복x)
	int yesterdayUserCount();
	
	// 오늘 접속사 수(중복x)
	int todayUserCount();
	
	// 어제 평균 접속 시간
	int yesterdayUserAvg();
	
	// 오늘 평균 접속 시간
	Integer todayUserAvg();
	
	// 유저의 시간별 로그인 횟수 체크
	List<UserCountDTO> userLoginCount(String loginDate);
	
	// 날짜 꺼내기
	List<String> selectDate();
	
	// 유저 시간별 로그인 횟수 (전체날짜)
	List<UserCountDTO> selectAllLoginCount();
	
	// 유저 로그인 횟수 전체
	Integer selectAllUserVisit();
}
