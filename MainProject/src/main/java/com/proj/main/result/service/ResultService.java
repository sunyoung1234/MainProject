package com.proj.main.result.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.result.dao.IResultDAO;
import com.proj.main.result.dto.EnergyResultDTO;
import com.proj.main.result.dto.EnergyUsedDTO;
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
	
}
