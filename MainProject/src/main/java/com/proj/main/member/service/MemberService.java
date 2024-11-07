package com.proj.main.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.member.dao.IMemberDAO;
import com.proj.main.member.dto.MemberDTO;

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
	
	// 회원 목록 불러오기 메소드
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
}
