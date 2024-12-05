package com.proj.main.pageLog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.pageLog.dao.IPageLogDAO;
import com.proj.main.pageLog.dto.PageLogDTO;

@Service
public class PageLogService {
	
	@Autowired
	IPageLogDAO dao;
	
	public int insertPageLog(PageLogDTO log) {
		int result = dao.insertPageLog(log);
		return result;
	}
	
	public List<PageLogDTO> selectPageLog(String memId) {
		List<PageLogDTO> result = dao.selectPageLog(memId);
		return result;
	}
	
	public List<PageLogDTO>allSelectPageLog() {
		List<PageLogDTO> result = dao.allSelectPageLog();
		return result;
	}
	
	public List<PageLogDTO> memIdSelectPageLog(){
		List<PageLogDTO> result = dao.memIdSelectPageLog();
		return result;
	}
	
	public List<PageLogDTO> distinctpageName(){
		List<PageLogDTO> result = dao.distinctpageName();
		return result;
	}
	
	public List<PageLogDTO> pageNameSelectPageLog(String pageName){
		List<PageLogDTO> result = dao.pageNameSelectPageLog(pageName);
		return result;
		
	}
	
	public List<PageLogDTO> selectIdPageCount(){
		List<PageLogDTO> result = dao.selectIdPageCount();
		return result;
	}
	
	public List<PageLogDTO> selectOneIdPageCount(String memId){
		List<PageLogDTO> result = dao.selectOneIdPageCount(memId);
		return result;
	}
	
	
}
