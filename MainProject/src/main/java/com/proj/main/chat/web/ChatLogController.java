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

    // ä��ȭ������ �̵�
    @RequestMapping("/chatView")
    public String chat(Model model, int roomNo) {
        // ä�ù� �� �޽��� ��������
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        RoomDTO room = roomService.getRoom(roomNo);

        model.addAttribute("room", room);
        model.addAttribute("chatList", chatList);
        
        System.out.println(chatList);

        return "chat/chatView";
    }

    // �ش� ä�ù��� ä�� ������ �������� (AJAX ��û)
    @ResponseBody
    @RequestMapping("/getChatList")
    public List<ChatLogDTO> selectChatList(int roomNo) {
        return chatService.getChatList(roomNo);
    }

    // ä�� �޽��� ����
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatLogDTO broadcasting(ChatLogDTO chat) {
//    	, HttpSession session
        // memName�� ��� �ִ� ��� ���ǿ��� ��������
//        if (chat.getMemName() == null || chat.getMemName().isEmpty()) {
//            chat.setMemName((String) session.getAttribute("memName"));
//        }
        
        System.out.println("chat: " + chat);
        // ä�� �޽��� DB�� ����
        chatService.insertChat(chat);

        // ��¥ ���� �� ��ȯ
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        chat.setSendDate(sdf.format(new Date()));

        return chat;
    }
}
