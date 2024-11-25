package com.proj.main.buildingElec.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.buildingElec.dto.BuildingDTO;
import com.proj.main.electricity.dto.ElectricityDTO;

@Mapper
public interface IBuildingDAO {
	
	int newInsertInfo(BuildingDTO elec);

}
