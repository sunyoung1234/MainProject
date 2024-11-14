package com.proj.main.proposal.dao;

import org.apache.ibatis.annotations.Mapper;
import com.proj.main.proposal.dto.ProposalDTO;
import java.util.List;

@Mapper
public interface IProposalDAO {
	
    int insertProposal(ProposalDTO proposal);  // 건의사항 작성
    
    ProposalDTO getProposalById(int propNo);  // 특정 건의사항 조회
    
    List<ProposalDTO> getAllProposals();  // 전체 건의사항 조회
}
