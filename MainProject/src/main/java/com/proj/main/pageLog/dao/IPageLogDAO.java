package com.proj.main.pageLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.pageLog.dto.PageLogDTO;

@Mapper
public interface IPageLogDAO {
	
	int insertPageLog(PageLogDTO log);
	
	// ���̵� ������ �α�
	List<PageLogDTO> selectPageLog(String memId);

	// ��� ������� �α� ���ؼ� ��������
	List<PageLogDTO> allSelectPageLog();
	
	// ���̵� ��������(�ߺ�����)
	List<PageLogDTO> memIdSelectPageLog();
	
	// page �̸����� ��������(�ߺ�����)
	List<PageLogDTO> distinctpageName();
	
	// page �̸����� ��������
	List<PageLogDTO> pageNameSelectPageLog(String pageName);
	
	// ���̵� ������ ���� Ƚ�� ��������
	List<PageLogDTO> selectIdPageCount();
	
	
}
