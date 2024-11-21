package com.proj.main.proposal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.main.proposal.dao.IProposalDAO;
import com.proj.main.proposal.dto.ProposalDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProposalService {

    @Autowired
    IProposalDAO dao;

    public int insertProposal(ProposalDTO proposal) {
        return dao.insertProposal(proposal);
    }

    public ProposalDTO getProposalById(int propNo) {
        return dao.getProposalById(propNo);
    }

    public List<ProposalDTO> getAllProposals() {
        return dao.getAllProposals();
    }
    
    public void addAnswer(Integer propNo, String answerContent, String answeredBy) {
        Map<String, Object> params = new HashMap<>();
        params.put("propNo", propNo);
        params.put("answerContent", answerContent);
        params.put("answeredBy", answeredBy);

        dao.addAnswer(params); // ���� ȣ��
    }

    public Map<String, Object> getProposalAnswer(int propNo) {
        return dao.getProposalAnswer(propNo);
    }
    
    public boolean verifyPassword(String memId, String password) {
        String storedPassword = dao.getPasswordByMemId(memId); // DAO�� ���� ����� ��й�ȣ ��ȸ
        if (storedPassword == null) {
            return false; // ID�� �߸��� ���
        }
        return storedPassword.equals(password);
    }
}
