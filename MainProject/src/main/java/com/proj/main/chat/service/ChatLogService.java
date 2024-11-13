package com.proj.main.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.chat.dao.IChatLogDAO;
import com.proj.main.chat.dto.ChatLogDTO;


@Service
public class ChatLogService {
    @Autowired
    private IChatLogDAO chatLogDAO;

    public List<ChatLogDTO> getChatList(int roomNo) {
        return chatLogDAO.getChatList(roomNo);
    }

    public int insertChat(ChatLogDTO chatLog) {
        return chatLogDAO.insertChat(chatLog);
    }

    public void clearChatLogs(int roomNo) {
        chatLogDAO.deleteAllByRoomNo(roomNo);
    }
}
