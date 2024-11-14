package com.proj.main.chat.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
    private ChatLogService chatService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    private Set<String> waitingUsers = new HashSet<>();

    @RequestMapping("/chatView")
    public String chat(Model model, int roomNo) {
        List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
        RoomDTO room = roomService.getRoom(roomNo);

        model.addAttribute("room", room);
        model.addAttribute("chatList", chatList);

        return "chat/chatView";
    }

    @ResponseBody
    @RequestMapping("/getChatList")
    public List<ChatLogDTO> selectChatList(int roomNo) {
        return chatService.getChatList(roomNo);
    }

    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatLogDTO broadcasting(ChatLogDTO chat) {
        chatService.insertChat(chat);
        chat.setSendDate(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(new Date()));
        return chat;
    }

    @PostMapping("/waitForAgent")
    @ResponseBody
    public void waitForAgent(@RequestParam String memName) {
        waitingUsers.add(memName);
        broadcastWaitingUsers();
    }

    @PostMapping("/cancelWaitForAgent")
    @ResponseBody
    public void cancelWaitForAgent(@RequestParam String memName) {
        waitingUsers.remove(memName);
        broadcastWaitingUsers();
        notifyAgentOfUserExit(memName);
    }

    private void broadcastWaitingUsers() {
        messagingTemplate.convertAndSend("/subscribe/chatbot/waitingUsers", waitingUsers);
    }

    private void notifyAgentOfUserExit(String memName) {
        String exitMessage = memName + "¥‘¿Ã ≈¿Â«œºÃΩ¿¥œ¥Ÿ.";
        messagingTemplate.convertAndSend("/subscribe/chatbot/notifications", exitMessage);
    }
}
