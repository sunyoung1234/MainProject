package com.proj.main.result.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.result.dao.IResultDAO;
import com.proj.main.result.dto.ApplyResultDTO;
import com.proj.main.result.dto.ApplyZEBDTO;
import com.proj.main.result.dto.EnergyResultDTO;
import com.proj.main.result.dto.EnergyUsedDTO;
import com.proj.main.result.dto.PdfImgDTO;
import com.proj.main.result.dto.TestResultDTO;
import com.proj.main.result.dto.UserBuildingDTO;

@Service
public class ResultService {

	@Autowired
	IResultDAO dao;
	
	public int insertEnergyResult(EnergyResultDTO er) {
		int result = dao.insertEnergyResult(er);
		return result;
	};
	
	public int insertEnergyUsed(EnergyUsedDTO eu) {
		int result = dao.insertEnergyUsed(eu);
		return result;
	};
	
	public int insertUserBuilding(UserBuildingDTO ub) {
		int result = dao.insertUserBuilding(ub);
		return result;
	}
	
	
	
	public UserBuildingDTO getUserBuilding(String b_id) {
		UserBuildingDTO result = dao.getUserBuilding(b_id);
		return result;
	};
	
	public EnergyResultDTO getEnergyResult(String b_id) {
		EnergyResultDTO result = dao.getEnergyResult(b_id);
		return result;
	};
	
	public EnergyUsedDTO getEnergyUsed(String b_id) {
		EnergyUsedDTO result = dao.getEnergyUsed(b_id);
		return result;
	};
	
	public int applyZEB(ApplyZEBDTO apply) {
		return dao.applyZEB(apply);
	}
	
	public String getBuildingId(MyBuildingDTO mb) {
		return dao.getBuildingId(mb);
	}
	
	public List<ApplyZEBDTO> applyStatusById(String memId){
		return dao.applyStatusById(memId);
	};
	
	public List<ApplyZEBDTO> applyStatusAdmin(){
		return dao.applyStatusAdmin();
	}
	
	public ApplyZEBDTO getApplyByBid(String buildingId) {
		return dao.getApplyByBid(buildingId);
	};
	
	public int insertTestResult(TestResultDTO tr) {
		return dao.insertTestResult(tr);
	}
	
	public int applyResult(ApplyResultDTO ar) {
		int result = dao.applyResult(ar);
		return result;
	}
	
	public int updateApplyStatus(ApplyResultDTO buildingId) {
		int result = dao.updateApplyStatus(buildingId);
		return result;
	}
	
	public int updateApplyZebReject(ApplyZEBDTO buildingId) {
		int result = dao.updateApplyZebReject(buildingId);
		return result;
	}
	
	public String selectApplyResult(ApplyResultDTO buildingId) {
		String result = dao.selectApplyResult(buildingId);
		return result;
	}
	

	// pdf 
	public int savePdfImg(PdfImgDTO pdf) {
		return dao.savePdfImg(pdf);
	}
	// pdf 
	public String getPdfImg(String bId) {
		return dao.getPdfImg(bId);
	}

	public List<ApplyZEBDTO> selectApplyZEBId(String memId){
		List<ApplyZEBDTO> result = dao.selectApplyZEBId(memId);
		return result;

	}
}
