package com.proj.main.proposal.dao;

import org.apache.ibatis.annotations.Mapper;
import com.proj.main.proposal.dto.ProposalDTO;
import java.util.List;
import java.util.Map;

@Mapper
public interface IProposalDAO {
	
    int insertProposal(ProposalDTO proposal);  // ���ǻ��� �ۼ�
    
    ProposalDTO getProposalById(int propNo);  // Ư�� ���ǻ��� ��ȸ
    
    List<ProposalDTO> getAllProposals();  // ��ü ���ǻ��� ��ȸ
    
    int addAnswer(Map<String, Object> answerData); // �亯 �߰�

    Map<String, Object> getProposalAnswer(int propNo); // �亯 ��ȸ
    
    String getPasswordByMemId(String memId); // ��й�ȣ Ȯ��

}
