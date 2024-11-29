package com.proj.main.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.map.dto.ZeroDTO;

@Mapper
public interface IMapDAO {

	List<ZeroDTO> getZeroList(); // 제로 빌딩 내역 불러오기 1500개 가량
	
	int addZeroBuilding(ZeroDTO zero); // 제로 빌딩 추가
}
