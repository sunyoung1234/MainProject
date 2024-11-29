package com.proj.main.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.map.dto.ZeroDTO;

@Mapper
public interface IMapDAO {

	List<ZeroDTO> getZeroList(); // ���� ���� ���� �ҷ����� 1500�� ����
	
	int addZeroBuilding(ZeroDTO zero); // ���� ���� �߰�
}
