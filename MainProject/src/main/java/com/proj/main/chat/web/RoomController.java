package com.proj.main.chat.web;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.ChatLogService;
import com.proj.main.chat.service.RoomService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.ActiveUserCounter;

@Controller
public class RoomController {

    @Autowired
    RoomService roomService;

    // 채팅방 목록 화면
    @RequestMapping("/chatListView")
    public String chatListView(Model model) {
        List<RoomDTO> roomList = roomService.getRoomList();
        model.addAttribute("roomList", roomList);
        model.addAttribute("activeUsers", ActiveUserCounter.getActiveSessions());
        return "chat/chatListView";
    }

    // 채팅방 생성 요청 (챗봇에서)
    @ResponseBody
    @PostMapping("/roomCreateDo")
    public Map<String, Object> roomCreateDo(RoomDTO room, HttpSession session) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        Map<String, Object> result = new HashMap<>();

        if (login == null) {
            result.put("status", "fail");
            result.put("redirect", "/loginView"); // 비로그인 시 loginView로 리다이렉트
            return result;
        }

        room.setMemId(login.getMemId());
        room.setMemName(login.getMemName());
        roomService.createRoom(room);

        result.put("status", "success");
        result.put("roomNo", room.getRoomNo());
        result.put("roomName", room.getRoomName());
        return result;
    }

    // 관리자가 사용자의 채팅방 목록을 가져오기 위한 API
    @ResponseBody
    @RequestMapping("/getRoomList")
    public List<RoomDTO> getRoomList() {
        return roomService.getRoomList();
    }

    // 채팅방 삭제
    @ResponseBody
    @PostMapping("/deleteRoom")
    public String deleteRoom(int roomNo, HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("login");
        RoomDTO room = roomService.getRoom(roomNo);

        if (loginUser != null && (loginUser.getMemId().equals(room.getMemId()) || loginUser.getMemId().equals("admin"))) {
            roomService.deleteRoom(roomNo);
            return "success";
        }
        return "fail";
    }

    @Autowired
    private ChatLogService chatLogService;

    // 채팅 로그 삭제
    @ResponseBody
    @PostMapping("/clearChat")
    public String clearChat(int roomNo, HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("login");
        RoomDTO room = roomService.getRoom(roomNo);

        if (loginUser != null && (loginUser.getMemId().equals(room.getMemId()) || loginUser.getMemId().equals("admin"))) {
            chatLogService.clearChatLogs(roomNo);
            return "success";
        }
        return "fail";
    }
    
    // 채팅방 생성 페이지로 이동
    @RequestMapping("/roomCreateView")
    public String roomCreateView() {
        return "chat/roomCreateView";
    }
}
