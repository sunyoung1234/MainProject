package com.proj.main.electricity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.electricity.dto.ElectricityDTO;

@Mapper
public interface IElectricityDAO {
	
	// 저번달 전기 사용량
	ElectricityDTO getElectricitylastMonth(String memId);
	
	int insertGetElectricityThisMonth(ElectricityDTO elec);
	
	List<String> getPredUse(String memId);
	
	String getDate(String memId);
	
	
}
