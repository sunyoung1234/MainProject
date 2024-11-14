package com.proj.main.proposal.web;

import java.text.SimpleDateFormat;
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
@RequestMapping("/proposal")  // 기본 경로 설정
public class ProposalController {

    @Autowired
    ProposalService proposalService;

	@RequestMapping("/faqView")
	public String faqView() {
		return "support/faqView";
	}    
    
    // 건의사항 목록 페이지로 이동
    @GetMapping("/view")
    public String proposalView(Model model) {
        List<ProposalDTO> proposalList = proposalService.getAllProposals();
        model.addAttribute("proposalList", proposalList);
        return "support/proposalView";  // proposalView.jsp 반환
    }

    // 건의사항 작성 페이지로 이동
    @GetMapping("/write")
    public String proposalWriteView(HttpSession session) {
        // 세션에서 로그인 여부 확인
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView";  // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
        }
        return "support/proposalWriteView";  // proposalWriteView.jsp 반환
    }

    // 건의사항 작성 처리
    @PostMapping("/writeDo")
    public String proposalWriteDo(ProposalDTO proposal, HttpSession session) {
        // 세션에서 로그인한 사용자 정보 가져오기
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView";  // 로그인 정보가 없을 때 로그인 페이지로 리다이렉트
        }

        String memId = mem.getMemId();
        proposal.setMemId(memId);

        // 현재 날짜 설정 및 ProposalID 생성
        proposal.setPropDate(new Date());
        String proposalId = new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date()) + memId;
        proposal.setPropId(proposalId);
        proposal.setPropStatus("Pending");
        proposal.setPropDelYn("N");

        // DB에 저장
        proposalService.insertProposal(proposal);
        return "redirect:/proposal/view";
    }
}
