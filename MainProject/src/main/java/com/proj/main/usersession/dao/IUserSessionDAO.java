package com.proj.main.usersession.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.usersession.dto.UserCountDTO;
import com.proj.main.usersession.dto.UserSessionDTO;

@Mapper
public interface IUserSessionDAO {
	
	
	// ����ڰ� �α����� �� ������ �߰� (SESSION_ID�� �ڵ� ����)
	int insertLoginUser(String memId);
	
	// ����ڰ� �α׾ƿ��� �� ������ �α׾ƿ� �ð��� ���� �ð����� ������Ʈ
	int updateLogoutTime(String memId);
	
	// �α׾ƿ� �ð��� ��ϵǸ�, ���� ���� �ð��� ����Ͽ� SESSION_DURATION �÷��� ������Ʈ
	int updateTimeCalc(String memId);
	
	// ����� ��� ���ӽð�
	List<UserSessionDTO> selectAvgDuration();
	
	// ���� ������ ��(�ߺ�x)
	int yesterdayUserCount();
	
	// ���� ���ӻ� ��(�ߺ�x)
	int todayUserCount();
	
	// ���� ��� ���� �ð�
	int yesterdayUserAvg();
	
	// ���� ��� ���� �ð�
	Integer todayUserAvg();
	
	// ������ �ð��� �α��� Ƚ�� üũ
	List<UserCountDTO> userLoginCount(String loginDate);
	
	// ��¥ ������
	List<String> selectDate();
	
	// ���� �ð��� �α��� Ƚ�� (��ü��¥)
	List<UserCountDTO> selectAllLoginCount();
	
	// ���� �α��� Ƚ�� ��ü
	Integer selectAllUserVisit();
}
