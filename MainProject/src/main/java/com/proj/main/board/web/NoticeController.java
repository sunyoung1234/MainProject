package com.proj.main.board.web;

import com.proj.main.board.dto.NoticeDTO;
import com.proj.main.board.service.NoticeService;
import com.proj.main.board.vo.SearchVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/noticeBoardView")
    public String noticeBoardView(@ModelAttribute SearchVO search, Model model) {
        if (search.getPageNo() == 0) { 
            search.setPageNo(1);
        }
        search.pageSetting();
        model.addAttribute("noticeList", noticeService.getNoticeList(search));
        model.addAttribute("pageSearch", search);
        return "board/noticeBoardView";
    }

    @RequestMapping("/noticeDetailView")
    public String noticeDetailView(@RequestParam int noticeNo, Model model) {
        noticeService.increaseViewCount(noticeNo); // ��ȸ�� ����
        model.addAttribute("notice", noticeService.getNoticeDetail(noticeNo));
        return "board/noticeDetailView";
    }

    @RequestMapping("/noticeWriteView")
    public String noticeWriteView() {
        return "board/noticeWriteView";
    }

    @PostMapping("/noticeWrite")
    public String noticeWrite(@ModelAttribute NoticeDTO notice, HttpSession session) {
        String memId = (String) session.getAttribute("loginId"); // ���ǿ��� �α��� ����� ID ��������
        if (memId == null || memId.isEmpty()) {
            memId = "������"; // �⺻�� ����
        }
        notice.setNoticeWriter(memId); // �ۼ��ڸ� �α��ε� ����ڷ� ����
        noticeService.insertNotice(notice);
        return "redirect:/noticeBoardView";
    }

 // ���� ȭ�� �̵�
    @RequestMapping("/noticeEditView")
    public String noticeEditView(@RequestParam int noticeNo, Model model) {
        NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);
        model.addAttribute("notice", notice);
        return "board/noticeEditView"; // ���� ȭ�� JSP ����
    }

    // ���� ��û ó��
    @PostMapping("/noticeEdit")
    public String noticeEdit(@ModelAttribute NoticeDTO notice) {
        noticeService.updateNotice(notice);
        return "redirect:/noticeDetailView?noticeNo=" + notice.getNoticeNo(); // ���� �� �󼼺���� �̵�
    }

    @GetMapping("/noticeDelete")
    public String noticeDeleteGet(@RequestParam int noticeNo) {
        noticeService.deleteNotice(noticeNo);
        return "redirect:/noticeBoardView";
    }
}
