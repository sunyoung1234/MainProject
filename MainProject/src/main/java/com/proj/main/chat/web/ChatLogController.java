package com.proj.main.chat.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String chat(Model model, @RequestParam int roomNo) {
        // ä�ù� �� �޽��� ��������
        RoomDTO room = roomService.getRoom(roomNo);
        if (room == null) {
            model.addAttribute("error", "ä�ù��� ã�� �� �����ϴ�.");
            return "errorPage";  // ���� ó�� ȭ������ �̵�
        }
        
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        
        model.addAttribute("room", room);
        model.addAttribute("chatList", chatList);

        return "chat/chatView";
    }

    // �ش� ä�ù��� ä�� ������ �������� (AJAX ��û)
    @ResponseBody
    @RequestMapping("/getChatList")
    public List<ChatLogDTO> selectChatList(int roomNo) {
        return chatService.getChatList(roomNo);
    }
    

    // ä�ù� ������ �������� (ä�ù� ���� + ä�� �α�)
    @RequestMapping("/getChatRoomData")
    @ResponseBody
    public Map<String, Object> getChatRoomData(@RequestParam int roomNo) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            RoomDTO room = roomService.getRoom(roomNo);
            if (room == null) {
                response.put("error", "�ش� ä�ù��� ã�� �� �����ϴ�.");
                return response;
            }

            List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
            response.put("roomNo", room.getRoomNo());
            response.put("roomName", room.getRoomName());
            response.put("chatList", chatList);

        } catch (Exception e) {
            System.err.println("���� �߻�: " + e.getMessage());
            response.put("error", "ä�ù� �����͸� �ҷ����� �� �����߽��ϴ�.");
        }
        
        return response;
    }

    // ä�� �޽��� ����
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatLogDTO broadcasting(ChatLogDTO chat) {
        System.out.println("chat: " + chat);
        // ä�� �޽��� DB�� ����
        chatService.insertChat(chat);

        // ��¥ ���� �� ��ȯ
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        chat.setSendDate(sdf.format(new Date()));
        
        int roomNo = chat.getRoomNo();
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        int idx = chatList.size();
        ChatLogDTO lastChat = chatList.get(idx-1);
        
        RoomDTO room1 = roomService.getRoom(roomNo);
        room1.setLastMessage(lastChat.getChatMsg());
        room1.setLastMessageTime(lastChat.getSendDate());
        
        roomService.updateLastMsg(room1);
        
        
        return chat;
    }
    
    
    @PostMapping("/sendChatMessage")
    @ResponseBody
    public String sendChatMessage(@RequestParam int roomNo, @RequestParam String memId,
                                   @RequestParam String memName, @RequestParam String chatMsg) {
        try {
            ChatLogDTO chatLog = new ChatLogDTO();
            chatLog.setRoomNo(roomNo);
            chatLog.setMemId(memId);
            chatLog.setMemName(memName);
            chatLog.setChatMsg(chatMsg);
            // �޽��� ����
            chatService.insertChat(chatLog);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

}
