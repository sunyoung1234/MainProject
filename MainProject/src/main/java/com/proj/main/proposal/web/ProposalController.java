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
@RequestMapping("/proposal")  // �⺻ ��� ����
public class ProposalController {

    @Autowired
    ProposalService proposalService;

	@RequestMapping("/faqView")
	public String faqView() {
		return "support/faqView";
	}    
    
    // ���ǻ��� ��� �������� �̵�
    @GetMapping("/view")
    public String proposalView(Model model) {
        List<ProposalDTO> proposalList = proposalService.getAllProposals();
        model.addAttribute("proposalList", proposalList);
        return "support/proposalView";  // proposalView.jsp ��ȯ
    }

    // ���ǻ��� �ۼ� �������� �̵�
    @GetMapping("/write")
    public String proposalWriteView(HttpSession session) {
        // ���ǿ��� �α��� ���� Ȯ��
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView";  // �α��� ������ ������ �α��� �������� �����̷�Ʈ
        }
        return "support/proposalWriteView";  // proposalWriteView.jsp ��ȯ
    }

    // ���ǻ��� �ۼ� ó��
    @PostMapping("/writeDo")
    public String proposalWriteDo(ProposalDTO proposal, HttpSession session) {
        // ���ǿ��� �α����� ����� ���� ��������
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView";  // �α��� ������ ���� �� �α��� �������� �����̷�Ʈ
        }

        String memId = mem.getMemId();
        proposal.setMemId(memId);

        // ���� ��¥ ���� �� ProposalID ����
        proposal.setPropDate(new Date());
        String proposalId = new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date()) + memId;
        proposal.setPropId(proposalId);
        proposal.setPropStatus("Pending");
        proposal.setPropDelYn("N");

        // DB�� ����
        proposalService.insertProposal(proposal);
        return "redirect:/proposal/view";
    }
}
