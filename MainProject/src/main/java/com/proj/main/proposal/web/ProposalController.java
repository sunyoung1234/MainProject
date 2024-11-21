package com.proj.main.proposal.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.proj.main.member.dto.MemberDTO;
import com.proj.main.proposal.dto.ProposalDTO;
import com.proj.main.proposal.service.ProposalService;

@Controller
@RequestMapping("/proposal")
public class ProposalController {

    @Autowired
    ProposalService proposalService;

    // FAQ 화면
    @RequestMapping("/faqView")
    public String faqView() {
        return "support/faqView";
    }

    // 건의사항 목록 화면
    @GetMapping("/view")
    public String proposalView(Model model) {
        List<ProposalDTO> proposalList = proposalService.getAllProposals();
        System.out.println(proposalList); // 데이터 확인
        if (proposalList == null || proposalList.isEmpty()) {
            proposalList = Collections.emptyList(); // 빈 리스트 처리
        }
        model.addAttribute("proposalList", proposalList);
        return "support/proposalView";
    }

    // 건의사항 작성 화면
    @GetMapping("/write")
    public String proposalWriteView(HttpSession session) {
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView"; // 로그인하지 않은 경우 리다이렉트
        }
        return "support/proposalWriteView"; // JSP와 연결
    }

    // 건의사항 작성 처리
    @PostMapping("/writeDo")
    public String proposalWriteDo(ProposalDTO proposal, HttpSession session) {
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView"; // 로그인하지 않은 경우 리다이렉트
        }

        String memId = mem.getMemId();
        proposal.setMemId(memId);
        proposal.setPropDate(new Date()); // 작성 날짜 설정
        String proposalId = new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date()) + memId;
        proposal.setPropId(proposalId);
        proposal.setPropStatus("Pending");
        proposal.setPropDelYn("N");

        proposalService.insertProposal(proposal); // 데이터베이스에 저장
        return "redirect:/proposal/view"; // 목록 페이지로 이동
    }

    // 답변 추가 처리
    @PostMapping("/addAnswer")
    public String addAnswer(
            @RequestParam("propNo") Integer propNo,
            @RequestParam("answerContent") String answerContent,
            HttpSession session) {
        // 관리자만 답변 추가 가능
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null || !"admin".equals(mem.getMemId())) {
            return "redirect:/loginView";
        }

        // 유효성 검사
        if (propNo == null || propNo <= 0 || answerContent == null || answerContent.trim().isEmpty()) {
            return "redirect:/proposal/view?error=invalid";
        }

        // 답변 저장 처리 (서비스 호출)
        proposalService.addAnswer(propNo, answerContent, mem.getMemId());

        return "redirect:/proposal/view?success=true"; // 성공 시 목록 페이지로 리다이렉트
    }

    // 비밀번호 검증 (추가적으로 사용 가능)
    @PostMapping("/verifyPassword")
    @ResponseBody
    public boolean verifyPassword(@RequestParam String memId, @RequestParam String password) {
        return proposalService.verifyPassword(memId, password);
    }
    
    
}
