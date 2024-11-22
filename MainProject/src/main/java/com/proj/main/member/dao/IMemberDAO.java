package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;

@Mapper
public interface IMemberDAO {
	// �쉶�썝媛��엯 
	int registMember(MemberDTO mem);
	
	// 濡쒓렇�씤
	MemberDTO loginMember(MemberDTO member);
	
	// �쉶�썝 �젙蹂� �닔�젙
	int updateMember(MemberDTO member);
	
	// 紐⑤뱺 �쉶�썝 紐⑸줉 議고쉶 硫붿냼�뱶
	List<MemberDTO> getMemberList();
	
	// �쉶�썝 �깉�눜
	int deleteMember(String memId);
	
	// �븘�씠�뵒 泥댄겕
	int checkId(String id);
	
	// 嫄대Ъ �쟾湲� �젙蹂� �궫�엯
	int insertBuilding(String memId);
	
	// �쉶�썝 嫄대Ъ �쟾湲� �젙蹂� 媛��졇�삤湲�
	List<MemBuildingElecDTO> getMemBuildingElec (String memId);
	

	// �쉶�썝 嫄대Ъ 二쇱냼 媛��졇�삤湲�
	MemberDTO getMemAddress(String memId);

	// �쉶�썝 嫄대Ъ �벑濡�
	int insertMyBuilding(MyBuildingDTO mb);
	
	List<MyBuildingDTO> getMyBuildings(String memId);
	
	List<MyBuildingDTO> getZebTestN(String memId);

}
