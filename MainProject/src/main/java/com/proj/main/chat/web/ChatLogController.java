package com.proj.main.chat.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.ChatLogDTO;
import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.ChatLogService;
import com.proj.main.chat.service.RoomService;

@Controller
public class ChatLogController {

    @Autowired
    ChatLogService chatService;

    @Autowired
    RoomService roomService;

    // 채팅화면으로 이동
    @RequestMapping("/chatView")
    public String chat(Model model, int roomNo) {
        // 채팅방 및 메시지 가져오기
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        RoomDTO room = roomService.getRoom(roomNo);

        model.addAttribute("room", room);
        model.addAttribute("chatList", chatList);
        
        System.out.println(chatList);

        return "chat/chatView";
    }

    // 해당 채팅방의 채팅 내역들 가져오기 (AJAX 요청)
    @ResponseBody
    @RequestMapping("/getChatList")
    public List<ChatLogDTO> selectChatList(int roomNo) {
        return chatService.getChatList(roomNo);
    }

    // 채팅 메시지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatLogDTO broadcasting(ChatLogDTO chat) {
//    	, HttpSession session
        // memName이 비어 있는 경우 세션에서 가져오기
//        if (chat.getMemName() == null || chat.getMemName().isEmpty()) {
//            chat.setMemName((String) session.getAttribute("memName"));
//        }
        
        System.out.println("chat: " + chat);
        // 채팅 메시지 DB에 저장
        chatService.insertChat(chat);

        // 날짜 설정 후 반환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        chat.setSendDate(sdf.format(new Date()));

        return chat;
    }
}
