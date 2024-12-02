package com.proj.main.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.member.dao.IMemberDAO;
import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.result.dto.TestResultDTO;

@Service
public class MemberService {

	@Autowired
	IMemberDAO dao;

	
	public int registMember(MemberDTO mem) {
		return dao.registMember(mem);
	}
	
	public MemberDTO loginMember(MemberDTO member) {
		return dao.loginMember(member);
	}

	public int updateMember(MemberDTO member) { 
		return dao.updateMember(member);
	}
	
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> result = dao.getMemberList();
		return result;
	}
	
	public int deleteMember(String memId) {
		int result = dao.deleteMember(memId);
		return result;
	}
	
	public int checkId(String id) {
		int result = dao.checkId(id);
		return result;
	}
	
	public int insertBuilding(String memId) {
		int result = dao.insertBuilding(memId);
		return result;
	}
	
	public List<MemBuildingElecDTO> getMemBuildingElec (String memId){
		List<MemBuildingElecDTO> result = dao.getMemBuildingElec(memId);
		return result;
	}
	

	public MemberDTO getMemAddress(String memId) {
		MemberDTO result = dao.getMemAddress(memId);
		return result;
	}

	public int insertMyBuilding(MyBuildingDTO mb) {
		int result = dao.insertMyBuilding(mb);
		return result;
	}
	
	public List<MyBuildingDTO> getMyBuildings(String memId){
		List<MyBuildingDTO> result = dao.getMyBuildings(memId);
		return result;
	}
	
	public List<MyBuildingDTO> getZebTestN(String memId){
		List<MyBuildingDTO> result = dao.getZebTestN(memId);
		return result;
	}
	
	public MyBuildingDTO getMyBuildingsByBuildingId(String buildingId) {
		return dao.getMyBuildingsByBuildingId(buildingId);
	}
	
	public int updateTestYn(String buildingName) {
		return dao.updateTestYn(buildingName);
	}
	
	public String getBuildingId(String buildingName) {
		return dao.getBuildingId(buildingName);
	}
	
	public TestResultDTO getTestResult(String buildingId) {
		return dao.getTestResult(buildingId);
	}
	
	public int updateZebLev(MyBuildingDTO mb) {
		return dao.updateZebLev(mb);
	}
	
	public int updateGradeByName(TestResultDTO tr) {
		return dao.updateGradeByName(tr); 
	}
	public int updateZebTestYn(MyBuildingDTO mb) {
		return dao.updateZebTestYn(mb);
	}
	
	public int updateProcessYn(MyBuildingDTO mb) {
		int result = dao.updateProcessYn(mb);
		return result;
	}
	
	public String selectBuildingName(MyBuildingDTO mb) {
		String result = dao.selectBuildingName(mb);
		return result;
	}
}
