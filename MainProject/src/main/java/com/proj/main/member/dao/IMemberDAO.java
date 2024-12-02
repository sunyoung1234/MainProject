package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.result.dto.TestResultDTO;

@Mapper
public interface IMemberDAO {

	int registMember(MemberDTO mem);
	
	MemberDTO loginMember(MemberDTO member);
	
	int updateMember(MemberDTO member);
	
	List<MemberDTO> getMemberList();
	
	int deleteMember(String memId);
	
	int checkId(String id);
	
	int insertBuilding(String memId);
	
	List<MemBuildingElecDTO> getMemBuildingElec (String memId);

	MemberDTO getMemAddress(String memId);

	int insertMyBuilding(MyBuildingDTO mb);
	
	List<MyBuildingDTO> getMyBuildings(String memId);
	
	List<MyBuildingDTO> getZebTestN(String memId);
	
	MyBuildingDTO getMyBuildingsByBuildingId(String buildingId);
	
	int updateTestYn(String buildingName);
	
	String getBuildingId(String buildingName);
	
	TestResultDTO getTestResult(String buildingId);
	
	int updateZebLev(MyBuildingDTO mb);
	
	int updateGradeByName(TestResultDTO tr);

	int updateZebTestYn(MyBuildingDTO mb);
	
	int updateProcessYn(MyBuildingDTO mb);
	
	String selectBuildingName(MyBuildingDTO mb);
}
