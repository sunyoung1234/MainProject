package com.proj.main.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.map.dao.IMapDAO;
import com.proj.main.map.dto.ZeroDTO;

@Service
public class MapService {

	@Autowired
	IMapDAO dao;
	
	public List<ZeroDTO> getZeroList(){
		
		List<ZeroDTO> result = dao.getZeroList();
		return result;
	}
}
