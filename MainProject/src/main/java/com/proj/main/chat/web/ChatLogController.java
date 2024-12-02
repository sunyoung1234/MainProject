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

    // 채팅화면으로 이동
    @RequestMapping("/chatView")
    public String chat(Model model, @RequestParam int roomNo) {
        // 채팅방 및 메시지 가져오기
        RoomDTO room = roomService.getRoom(roomNo);
        if (room == null) {
            model.addAttribute("error", "채팅방을 찾을 수 없습니다.");
            return "errorPage";  // 예외 처리 화면으로 이동
        }
        
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        
        model.addAttribute("room", room);
        model.addAttribute("chatList", chatList);

        return "chat/chatView";
    }

    // 해당 채팅방의 채팅 내역들 가져오기 (AJAX 요청)
    @ResponseBody
    @RequestMapping("/getChatList")
    public List<ChatLogDTO> selectChatList(int roomNo) {
        return chatService.getChatList(roomNo);
    }
    

    // 채팅방 데이터 가져오기 (채팅방 정보 + 채팅 로그)
    @RequestMapping("/getChatRoomData")
    @ResponseBody
    public Map<String, Object> getChatRoomData(@RequestParam int roomNo) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            RoomDTO room = roomService.getRoom(roomNo);
            if (room == null) {
                response.put("error", "해당 채팅방을 찾을 수 없습니다.");
                return response;
            }

            List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
            response.put("roomNo", room.getRoomNo());
            response.put("roomName", room.getRoomName());
            response.put("chatList", chatList);

        } catch (Exception e) {
            System.err.println("오류 발생: " + e.getMessage());
            response.put("error", "채팅방 데이터를 불러오는 데 실패했습니다.");
        }
        
        return response;
    }

    // 채팅 메시지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatLogDTO broadcasting(ChatLogDTO chat) {
        System.out.println("chat: " + chat);
        // 채팅 메시지 DB에 저장
        chatService.insertChat(chat);

        // 날짜 설정 후 반환
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
            // 메시지 삽입
            chatService.insertChat(chatLog);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

}
