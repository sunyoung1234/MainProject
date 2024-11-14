package com.proj.main.proposal.dao;

import org.apache.ibatis.annotations.Mapper;
import com.proj.main.proposal.dto.ProposalDTO;
import java.util.List;

@Mapper
public interface IProposalDAO {
	
    int insertProposal(ProposalDTO proposal);  // ���ǻ��� �ۼ�
    
    ProposalDTO getProposalById(int propNo);  // Ư�� ���ǻ��� ��ȸ
    
    List<ProposalDTO> getAllProposals();  // ��ü ���ǻ��� ��ȸ
}
