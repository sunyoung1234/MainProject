package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;

@Mapper
public interface IMemberDAO {
	// 회원가입 
	int registMember(MemberDTO mem);
	
	// 로그인
	MemberDTO loginMember(MemberDTO member);
	
	// 회원 정보 수정
	int updateMember(MemberDTO member);
	
	// 모든 회원 목록 조회 메소드
	List<MemberDTO> getMemberList();
	
	// 회원 탈퇴
	int deleteMember(String memId);
	
	// 아이디 체크
	int checkId(String id);
	
	// 건물 전기 정보 삽입
	int insertBuilding(String memId);
	
	// 회원 건물 전기 정보 가져오기
	List<MemBuildingElecDTO> getMemBuildingElec (String memId);
	
	// 회원 건물 등록
	int insertMyBuilding(MyBuildingDTO mb);
	
	List<MyBuildingDTO> getMyBuildings(String memId);
}
