package com.proj.main.chat.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.ChatLogDTO;
import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.ChatLogService;
import com.proj.main.chat.service.RoomService;
import com.proj.main.member.dto.MemberDTO;

@Controller
public class RoomController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	ChatLogService chatService;
	
	@Autowired
    private SimpMessagingTemplate messagingTemplate;
	
	@RequestMapping("/connect-agent")
    @ResponseBody
    public RoomDTO connectAgent(@RequestBody Map<String, Object> requestData) {
        String memId = (String) requestData.get("memId");
        String memName = (String) requestData.get("memName");
        
        Map<String, String> response = new HashMap<>();
        RoomDTO room = new RoomDTO();
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        String roomName = memName + sdf.format(date);
        
        room.setMemId(memId);
        room.setMemName(memName);
        room.setRoomName(roomName);
        
        roomService.createRoom(room);
        
        RoomDTO createdRoom = roomService.getRoomByName(roomName);
        

        return createdRoom;
    }
	
	@RequestMapping("/getChatHistory")
    @ResponseBody
    public List<ChatLogDTO> getChatHistory(@RequestBody Map<String, Object> requestData){
		int roomNo = (int) requestData.get("roomNo");
		
		List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
		
		return chatList;
	}
	

	// 채팅방 목록 화면
	@RequestMapping("/chatListView")
	public String chatListView(Model model) {
		
		List<RoomDTO> roomList = roomService.getRoomList();
		model.addAttribute("roomList", roomList);
		
		return "chat/chatListView";
	}
	
	// 채팅방 생성 화면
	@RequestMapping("/roomCreateView")
	public String roomCreateView(Model model, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null) {
			return "member/loginView";
		}
		
		return "chat/roomCreateView";
	}
	
	// 채팅방 생성
	@RequestMapping("/roomCreateDo")
	public String roomCreateDo(RoomDTO room, HttpSession session) {
		
		System.out.println(room);
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/loginView";
		}
		
		room.setMemId(login.getMemId());
		room.setMemName(login.getMemName());
		
		roomService.createRoom(room);
		
		return "redirect:/chatListView";
	}
	
	@RequestMapping("/adminChatView")
	public String adminChatView(HttpSession session, Model model) {
		
		List<RoomDTO> roomList = roomService.getRoomList();
		model.addAttribute("roomList", roomList);
		
		
		return "chat/adminChatView";
	}
	
	
}


