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
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	public Map<String, Object> connectAgent(@RequestBody Map<String, Object> requestData) {
	    String memId = (String) requestData.get("memId");
	    String memName = (String) requestData.get("memName");

	    RoomDTO existingRoom = roomService.getRoomByMemId(memId);
	    Map<String, Object> response = new HashMap<>();

	    if (existingRoom != null) {
	        response.put("roomNo", existingRoom.getRoomNo());
	        response.put("roomName", existingRoom.getRoomName());
	        response.put("isNewRoom", false); // 기존 방일 경우
	    } else {
	        RoomDTO room = new RoomDTO();

	        Date date = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

	        String roomName = memName + sdf.format(date);

	        room.setMemId(memId);
	        room.setMemName(memName);
	        room.setRoomName(roomName);
	        room.setLastMessage("새로운 상담요청입니다");
	        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:SS");
			String time = sdf2.format(new Date());
			room.setLastMessageTime(time);

	        roomService.createRoom(room);

	        RoomDTO createdRoom = roomService.getRoomByName(roomName);

	        response.put("roomNo", createdRoom.getRoomNo());
	        response.put("roomName", createdRoom.getRoomName());
	        response.put("isNewRoom", true); // 새로운 방 생성
	    }

	    return response;
	}
	
	@RequestMapping("/getRoomByMemId")
	@ResponseBody
	public RoomDTO getRoomByMemId(@RequestBody RoomDTO room) {
		String memId = (String) room.getMemId();
		RoomDTO room1 = roomService.getRoomByMemId(memId);
		
		return room1;
	}
	
	@RequestMapping("/userUnreadCount")
	@ResponseBody
	public String userUnreadCount(@RequestBody Map<String, Object> requestData) {
		int roomNo = (int) requestData.get("roomNo");
		RoomDTO room = roomService.getRoom(roomNo);
		room.setUserUnreadCount(room.getUserUnreadCount()+1);
		roomService.updateUserUnread(room);
		
		return "unreadcount plus";
	}
	
	@RequestMapping("/getUserUnreadCount")
	@ResponseBody
	public int getUserUnreadCount(@RequestBody Map<String, Object> requestData) {
		int roomNo = (int) requestData.get("roomNo");
		RoomDTO room = roomService.getRoom(roomNo);
		int count = room.getUserUnreadCount();
		
		return count;
	}
	
	@RequestMapping("/uucZero")
	@ResponseBody
	public int uucZero(@RequestBody Map<String, Object> requestData) {
		int roomNo = (int) requestData.get("roomNo");
		RoomDTO room = roomService.getRoom(roomNo);
		room.setUserUnreadCount(0);
		
		roomService.updateUserUnread(room);
		
		return 0;
	}
	
	
	
	@RequestMapping("/deleteRoom")
	@ResponseBody 
	public RoomDTO deleteRoom(@RequestBody RoomDTO room) {
		
		String memId = (String) room.getMemId();
		RoomDTO room1 = roomService.getRoomByMemId(memId);
		int roomNo = room1.getRoomNo();
		
		room.setRoomNo(roomNo);
		
		roomService.delRoom(roomNo); 
		
		return room;
	}
	
	@MessageMapping("/delete")
	@SendTo("/subscribe/delete")
	public RoomDTO deleteR(RoomDTO room) {
		int roomNo = room.getRoomNo();
		RoomDTO room1 = new RoomDTO();
		room1.setRoomNo(roomNo);
		
	    return room1;
	}
	
	@MessageMapping("/room")
	@SendTo("/subscribe/room")
	public RoomDTO broadcasting(RoomDTO room) {
		
		return room;
	}
	
	@MessageMapping("/room/{roomNo}")
	@SendTo("/subscribe/room")
	public RoomDTO updateRoom(RoomDTO room) {
		
		int roomNo = room.getRoomNo();
		RoomDTO room1 = roomService.getRoom(roomNo);
		
		int unreadCount = room1.getUnreadCount();
		System.out.println(unreadCount);
		
		room1.setUnreadCount(unreadCount + 1);
		roomService.updateUnreadCount(room1);
		System.out.println("안읽은 메세지::::::" + room1.getUnreadCount());
		
		return room1;
	}
	
	@MessageMapping("/roomUnreadZero/{roomNo}")
	@SendTo("/subscribe/room")
	public RoomDTO updateRoomUnread(RoomDTO room) {
		
		int roomNo = room.getRoomNo();
		RoomDTO room1 = roomService.getRoom(roomNo);
		
		room1.setUnreadCount(0);
		roomService.updateUnreadCount(room1);

		System.out.println("33333333333" + room1.getUnreadCount());
		return room1;
	}
	
	@MessageMapping("/updateUnreadZero/{roomNo}")
	public void updateUnreadZero(RoomDTO room) {
		int roomNo = room.getRoomNo();
		RoomDTO room1 = roomService.getRoom(roomNo);
		System.out.println("room1 :" + room1.getUnreadCount());
		room1.setUnreadCount(0);
		roomService.updateUnreadCount(room1);
		System.out.println("room1 :" + room1.getUnreadCount());
	}
	
	
	
	
	@RequestMapping("/getChatHistory")
    @ResponseBody
    public List<ChatLogDTO> getChatHistory(@RequestBody Map<String, Object> requestData, HttpSession session){
		int roomNo = (int) requestData.get("roomNo");
		
		List<ChatLogDTO> chatList = chatService.getChatList(roomNo);
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String memId = login.getMemId();
		
		for(ChatLogDTO chat : chatList) {
		   if(!chat.getMemId().equals(memId)) {
			   chat.setReadYn("Y");
		   }
        }
		
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

		room.setLastMessage("새로운 상담 요청입니다");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:SS");
		String time = sdf.format(new Date());
		room.setLastMessageTime(time);
		
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


