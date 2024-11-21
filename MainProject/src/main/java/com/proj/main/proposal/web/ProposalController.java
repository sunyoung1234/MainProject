package com.proj.main.proposal.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        if (proposalList == null || proposalList.isEmpty()) {
            proposalList = Collections.emptyList();
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
        return "support/proposalWriteView";
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
        proposal.setPropStatus("������");
        proposal.setPropDelYn("N");

        proposalService.insertProposal(proposal);
        return "redirect:/proposal/view";
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

        // �亯 ���� ó��
        proposalService.addAnswer(propNo, answerContent, mem.getMemId());

        return "redirect:/proposal/view?success=true";
    }

    // ��й�ȣ ����
    @GetMapping("/getSessionInfo")
    @ResponseBody
    public MemberDTO getSessionInfo(HttpSession session) {
        MemberDTO loggedInUser = (MemberDTO) session.getAttribute("login");
        return loggedInUser != null ? loggedInUser : new MemberDTO(); // ��α��� �� �� ��ü ��ȯ
    }

    @PostMapping("/verifyPassword")
    @ResponseBody
    public boolean verifyPassword(@RequestBody Map<String, String> requestData) {
        String memId = requestData.get("memId");
        String password = requestData.get("password");

        if (memId == null || password == null) {
            throw new IllegalArgumentException("memId or password is missing");
        }

        return proposalService.verifyPassword(memId, password);
    }
}
