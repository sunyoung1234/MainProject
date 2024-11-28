package com.proj.main.pageLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.pageLog.dto.PageLogDTO;

@Mapper
public interface IPageLogDAO {
	
	int insertPageLog(PageLogDTO log);
	
	// 아이디별 페이지 로그
	List<PageLogDTO> selectPageLog(String memId);

	// 모든 사용자의 로그 더해서 가져오기
	List<PageLogDTO> allSelectPageLog();
	
	// 아이디 가져오기(중복없이)
	List<PageLogDTO> memIdSelectPageLog();
	
	// page 이름으로 가져오기(중복없이)
	List<PageLogDTO> distinctpageName();
	
	// page 이름으로 가져오기
	List<PageLogDTO> pageNameSelectPageLog(String pageName);
	
	// 아이디별 페이지 접속 횟수 가져오기
	List<PageLogDTO> selectIdPageCount();
	
	
}
