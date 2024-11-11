package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemberDTO;

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
	
	// �ǹ� ���� ����
	int insertBuilding(String memId);
}
