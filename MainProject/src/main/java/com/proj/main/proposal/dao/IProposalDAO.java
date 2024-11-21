package com.proj.main.proposal.dao;

import org.apache.ibatis.annotations.Mapper;
import com.proj.main.proposal.dto.ProposalDTO;
import java.util.List;
import java.util.Map;

@Mapper
public interface IProposalDAO {
	
    int insertProposal(ProposalDTO proposal);  // 건의사항 작성
    
    ProposalDTO getProposalById(int propNo);  // 특정 건의사항 조회
    
    List<ProposalDTO> getAllProposals();  // 전체 건의사항 조회
    
    int addAnswer(Map<String, Object> answerData); // 답변 추가

    Map<String, Object> getProposalAnswer(int propNo); // 답변 조회
    
    String getPasswordByMemId(String memId); // 비밀번호 확인

}
