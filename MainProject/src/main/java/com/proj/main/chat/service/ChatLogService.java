package com.proj.main.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.dao.DataAccessException;

import com.proj.main.chat.dao.IChatLogDAO;
import com.proj.main.chat.dto.ChatLogDTO;

@Service
public class ChatLogService {

    @Autowired
    IChatLogDAO dao;
    
    // ä�� ��� ��������
    public List<ChatLogDTO> getChatList(int roomNo){
        try {
            // ä�ù� ��ȣ�� �´� ä�� ����� �������� �޼���
            List<ChatLogDTO> result = dao.getChatList(roomNo);
            return result;
        } catch (DataAccessException e) {
            // ���� �߻� �� �α� �� ���� ó��
            System.err.println("ä�� ��� ��ȸ ����: " + e.getMessage());
            throw new RuntimeException("ä�� ����� �ҷ����� �� �����߽��ϴ�.");
        }
    }
    
    // ä�� �޽��� DB�� ����
    public int insertChat(ChatLogDTO chatLog) {
        try {
            // ä�� �޽����� DB�� �����ϴ� �޼���
            int result = dao.insertChat(chatLog);
            return result;
        } catch (DataAccessException e) {
            // ���� �߻� �� �α� �� ���� ó��
            System.err.println("ä�� �޽��� ���� ����: " + e.getMessage());
            throw new RuntimeException("ä�� �޽��� ���忡 �����߽��ϴ�.");
        }
    }
}
