package com.proj.main.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.result.dto.TestResultDTO;

@Mapper
public interface IMemberDAO {

	// 占쎌돳占쎌뜚揶쏉옙占쎌뿯 
	int registMember(MemberDTO mem);
	
	// 嚥≪뮄�젃占쎌뵥
	MemberDTO loginMember(MemberDTO member);
	
	// 占쎌돳占쎌뜚 占쎌젟癰귨옙 占쎈땾占쎌젟
	int updateMember(MemberDTO member);
	
	// 筌뤴뫀諭� 占쎌돳占쎌뜚 筌뤴뫖以� 鈺곌퀬�돳 筌롫뗄�꺖占쎈굡
	List<MemberDTO> getMemberList();
	
	// 占쎌돳占쎌뜚 占쎄퉱占쎈닚
	int deleteMember(String memId);
	
	// 占쎈툡占쎌뵠占쎈탵 筌ｋ똾寃�
	int checkId(String id);
	
	// 椰꾨�窺 占쎌읈疫뀐옙 占쎌젟癰귨옙 占쎄땜占쎌뿯
	int insertBuilding(String memId);
	
	// 占쎌돳占쎌뜚 椰꾨�窺 占쎌읈疫뀐옙 占쎌젟癰귨옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
	List<MemBuildingElecDTO> getMemBuildingElec (String memId);
	

	// 占쎌돳占쎌뜚 椰꾨�窺 雅뚯눘�꺖 揶쏉옙占쎌죬占쎌궎疫뀐옙
	MemberDTO getMemAddress(String memId);

	// 占쎌돳占쎌뜚 椰꾨�窺 占쎈쾻嚥∽옙
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
}
