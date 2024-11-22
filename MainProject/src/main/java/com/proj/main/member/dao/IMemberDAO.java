package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;

@Mapper
public interface IMemberDAO {
	// ȸ������ 
	int registMember(MemberDTO mem);
	
	// �α���
	MemberDTO loginMember(MemberDTO member);
	
	// ȸ�� ���� ����
	int updateMember(MemberDTO member);
	
	// ��� ȸ�� ��� ��ȸ �޼ҵ�
	List<MemberDTO> getMemberList();
	
	// ȸ�� Ż��
	int deleteMember(String memId);
	
	// ���̵� üũ
	int checkId(String id);
	
	// �ǹ� ���� ���� ����
	int insertBuilding(String memId);
	
	// ȸ�� �ǹ� ���� ���� ��������
	List<MemBuildingElecDTO> getMemBuildingElec (String memId);
	
	// ȸ�� �ǹ� ���
	int insertMyBuilding(MyBuildingDTO mb);
	
	List<MyBuildingDTO> getMyBuildings(String memId);
}
