package com.proj.main.electricity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.electricity.dao.IElectricityDAO;
import com.proj.main.electricity.dto.ElectricityDTO;

@Service
public class ElectricityService {
	
	@Autowired
	IElectricityDAO dao;
	
	public ElectricityDTO getElectricitylastMonth(String memId){
		ElectricityDTO result = dao.getElectricitylastMonth(memId);
		return result;
	}
	
	public int insertGetElectricityThisMonth(ElectricityDTO elec) {
		int result = dao.insertGetElectricityThisMonth(elec);
		return result;
	}
}
