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
        noticeService.increaseViewCount(noticeNo); // 조회수 증가
        model.addAttribute("notice", noticeService.getNoticeDetail(noticeNo));
        return "board/noticeDetailView";
    }

    @RequestMapping("/noticeWriteView")
    public String noticeWriteView() {
        return "board/noticeWriteView";
    }

    @PostMapping("/noticeWrite")
    public String noticeWrite(@ModelAttribute NoticeDTO notice, HttpSession session) {
        String memId = (String) session.getAttribute("loginId"); // 세션에서 로그인 사용자 ID 가져오기
        if (memId == null || memId.isEmpty()) {
            memId = "관리자"; // 기본값 설정
        }
        notice.setNoticeWriter(memId); // 작성자를 로그인된 사용자로 설정
        noticeService.insertNotice(notice);
        return "redirect:/noticeBoardView";
    }

    @PostMapping("/noticeEdit")
    public String noticeEdit(@ModelAttribute NoticeDTO notice) {
        noticeService.updateNotice(notice);
        return "redirect:/noticeBoardView";
    }

    @GetMapping("/noticeDelete")
    public String noticeDeleteGet(@RequestParam int noticeNo) {
        noticeService.deleteNotice(noticeNo);
        return "redirect:/noticeBoardView";
    }
}
