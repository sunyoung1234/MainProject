package com.proj.main.buildingElec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.buildingElec.dao.IBuildingDAO;
import com.proj.main.buildingElec.dto.BuildingDTO;
import com.proj.main.electricity.dto.ElectricityDTO;

@Service
public class BuildingService {

	
	@Autowired
	IBuildingDAO dao;
	
	public int newInsertInfo(BuildingDTO elec) {
		int result = dao.newInsertInfo(elec);
		return result;
	}
}
