package com.proj.main.result.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.result.dto.EnergyResultDTO;
import com.proj.main.result.dto.EnergyUsedDTO;
import com.proj.main.result.dto.UserBuildingDTO;

@Mapper
public interface IResultDAO {

	int insertEnergyResult(EnergyResultDTO er);
	
	int insertEnergyUsed(EnergyUsedDTO eu);
	
	int insertUserBuilding(UserBuildingDTO ub);
	
	UserBuildingDTO getUserBuilding(String b_id);
	
	EnergyResultDTO getEnergyResult(String b_id);
	
	EnergyUsedDTO getEnergyUsed(String b_id);
	
	
}
