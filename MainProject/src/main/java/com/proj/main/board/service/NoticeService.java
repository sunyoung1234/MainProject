package com.proj.main.board.service;

import com.proj.main.board.dao.INoticeDAO;
import com.proj.main.board.dto.NoticeDTO;
import com.proj.main.board.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    private final INoticeDAO noticeDAO;

    @Autowired
    public NoticeService(INoticeDAO noticeDAO) {
        this.noticeDAO = noticeDAO;
    }

    public List<NoticeDTO> getNoticeList(SearchVO search) {
        return noticeDAO.getNoticeList(search);
    }

    public int getNoticeCount(SearchVO search) {
        return noticeDAO.getNoticeCount(search);
    }

    public NoticeDTO getNoticeDetail(int noticeNo) {
        return noticeDAO.getNoticeDetail(noticeNo);
    }

    public void insertNotice(NoticeDTO notice) {
        noticeDAO.insertNotice(notice);
    }

    public void updateNotice(NoticeDTO notice) {
        noticeDAO.updateNotice(notice);
    }

    public void deleteNotice(int noticeNo) {
        noticeDAO.deleteNotice(noticeNo);
    }
    
    public void increaseViewCount(int noticeNo) {
        noticeDAO.increaseViewCount(noticeNo);
    }
    
}
