package com.proj.main.board.dao;

import java.util.List;
import com.proj.main.board.dto.NoticeDTO;
import com.proj.main.board.vo.SearchVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface INoticeDAO {
	List<NoticeDTO> getNoticeList(SearchVO search); // 공지사항 목록 가져오기

	int getNoticeCount(SearchVO search); // 공지사항 총 개수 가져오기

	NoticeDTO getNoticeDetail(int noticeNo); // 공지사항 상세 가져오기

	int insertNotice(NoticeDTO notice); // 공지사항 작성

	int updateNotice(NoticeDTO notice); // 공지사항 수정

	int deleteNotice(int noticeNo); // 공지사항 삭제
	
	 int increaseViewCount(int noticeNo); // 조회수 증가 메서드
	
}