package com.proj.main.proposal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.main.proposal.dao.IProposalDAO;
import com.proj.main.proposal.dto.ProposalDTO;
import java.util.List;

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
}
