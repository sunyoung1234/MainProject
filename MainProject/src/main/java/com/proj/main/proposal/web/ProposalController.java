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

    // FAQ ȭ��
    @RequestMapping("/faqView")
    public String faqView() {
        return "support/faqView";
    }

    // ���ǻ��� ��� ȭ��
    @GetMapping("/view")
    public String proposalView(Model model) {
        List<ProposalDTO> proposalList = proposalService.getAllProposals();
        System.out.println(proposalList); // ������ Ȯ��
        if (proposalList == null || proposalList.isEmpty()) {
            proposalList = Collections.emptyList(); // �� ����Ʈ ó��
        }
        model.addAttribute("proposalList", proposalList);
        return "support/proposalView";
    }

    // ���ǻ��� �ۼ� ȭ��
    @GetMapping("/write")
    public String proposalWriteView(HttpSession session) {
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView"; // �α������� ���� ��� �����̷�Ʈ
        }
        return "support/proposalWriteView"; // JSP�� ����
    }

    // ���ǻ��� �ۼ� ó��
    @PostMapping("/writeDo")
    public String proposalWriteDo(ProposalDTO proposal, HttpSession session) {
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null) {
            return "redirect:/loginView"; // �α������� ���� ��� �����̷�Ʈ
        }

        String memId = mem.getMemId();
        proposal.setMemId(memId);
        proposal.setPropDate(new Date()); // �ۼ� ��¥ ����
        String proposalId = new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date()) + memId;
        proposal.setPropId(proposalId);
        proposal.setPropStatus("Pending");
        proposal.setPropDelYn("N");

        proposalService.insertProposal(proposal); // �����ͺ��̽��� ����
        return "redirect:/proposal/view"; // ��� �������� �̵�
    }

    // �亯 �߰� ó��
    @PostMapping("/addAnswer")
    public String addAnswer(
            @RequestParam("propNo") Integer propNo,
            @RequestParam("answerContent") String answerContent,
            HttpSession session) {
        // �����ڸ� �亯 �߰� ����
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        if (mem == null || !"admin".equals(mem.getMemId())) {
            return "redirect:/loginView";
        }

        // ��ȿ�� �˻�
        if (propNo == null || propNo <= 0 || answerContent == null || answerContent.trim().isEmpty()) {
            return "redirect:/proposal/view?error=invalid";
        }

        // �亯 ���� ó�� (���� ȣ��)
        proposalService.addAnswer(propNo, answerContent, mem.getMemId());

        return "redirect:/proposal/view?success=true"; // ���� �� ��� �������� �����̷�Ʈ
    }

    // ��й�ȣ ���� (�߰������� ��� ����)
    @PostMapping("/verifyPassword")
    @ResponseBody
    public boolean verifyPassword(@RequestParam String memId, @RequestParam String password) {
        return proposalService.verifyPassword(memId, password);
    }
    
    
}
