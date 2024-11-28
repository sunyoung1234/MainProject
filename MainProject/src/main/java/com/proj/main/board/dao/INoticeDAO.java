package com.proj.main.board.dao;

import java.util.List;
import com.proj.main.board.dto.NoticeDTO;
import com.proj.main.board.vo.SearchVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface INoticeDAO {
	List<NoticeDTO> getNoticeList(SearchVO search); // �������� ��� ��������

	int getNoticeCount(SearchVO search); // �������� �� ���� ��������

	NoticeDTO getNoticeDetail(int noticeNo); // �������� �� ��������

	int insertNotice(NoticeDTO notice); // �������� �ۼ�

	int updateNotice(NoticeDTO notice); // �������� ����

	int deleteNotice(int noticeNo); // �������� ����
	
	 int increaseViewCount(int noticeNo); // ��ȸ�� ���� �޼���
	
}