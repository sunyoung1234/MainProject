package com.proj.main.usersession.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserSessionDAO {
	
	
	// ����ڰ� �α����� �� ������ �߰� (SESSION_ID�� �ڵ� ����)
	int insertLoginUser(String memId);
	
	// ����ڰ� �α׾ƿ��� �� ������ �α׾ƿ� �ð��� ���� �ð����� ������Ʈ
	int updateLogoutTime(String memId);
	
	// �α׾ƿ� �ð��� ��ϵǸ�, ���� ���� �ð��� ����Ͽ� SESSION_DURATION �÷��� ������Ʈ
	int updateTimeCalc(String memId);
	
}
