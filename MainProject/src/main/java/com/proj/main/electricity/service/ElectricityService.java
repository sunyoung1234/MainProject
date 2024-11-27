package com.proj.main.electricity.service;

import java.util.List;

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
	
	public List<String> getPredUse(String memId) {
		List<String> result = dao.getPredUse(memId);
		return result;
	}
	
	public String getDate(String memId) {
		String result = dao.getDate(memId);
		return result;
	}
	
	public String predictUse(String memId) {
		String result = dao.predictUse(memId);
		return result;
	}
	
}
