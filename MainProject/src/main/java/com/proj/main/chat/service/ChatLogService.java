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
    
    // 채팅 목록 가져오기
    public List<ChatLogDTO> getChatList(int roomNo){
        try {
            // 채팅방 번호에 맞는 채팅 목록을 가져오는 메서드
            List<ChatLogDTO> result = dao.getChatList(roomNo);
            return result;
        } catch (DataAccessException e) {
            // 예외 발생 시 로깅 후 예외 처리
            System.err.println("채팅 목록 조회 실패: " + e.getMessage());
            throw new RuntimeException("채팅 목록을 불러오는 데 실패했습니다.");
        }
    }
    
    // 채팅 메시지 DB에 저장
    public int insertChat(ChatLogDTO chatLog) {
        try {
            // 채팅 메시지를 DB에 삽입하는 메서드
            int result = dao.insertChat(chatLog);
            return result;
        } catch (DataAccessException e) {
            // 예외 발생 시 로깅 후 예외 처리
            System.err.println("채팅 메시지 저장 실패: " + e.getMessage());
            throw new RuntimeException("채팅 메시지 저장에 실패했습니다.");
        }
    }
}
