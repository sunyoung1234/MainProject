package com.proj.main.electricity.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.electricity.dto.ElectricityDTO;

@Mapper
public interface IElectricityDAO {
	
	// ������ ���� ��뷮
	ElectricityDTO getElectricitylastMonth(String memId);
	
	int insertGetElectricityThisMonth(ElectricityDTO elec);
	
	
}
