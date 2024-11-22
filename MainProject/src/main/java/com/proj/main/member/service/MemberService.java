package com.proj.main.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.member.dao.IMemberDAO;
import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;

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
	
	// 회원목록 불러오기
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
}
