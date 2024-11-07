package com.proj.main.attach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.attach.dto.AttachDTO;

@Mapper
public interface IAttachDAO {
	
	int insertAttach(AttachDTO attach);
	
	List<AttachDTO> getAttachList(int boardNo);
}
