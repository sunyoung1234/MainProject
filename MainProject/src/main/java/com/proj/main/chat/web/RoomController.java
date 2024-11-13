package com.proj.main.chat.web;

import java.util.List;
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
import com.proj.main.ActiveUserCounter; // ActiveUserCounter 클래스 임포트

@Controller
public class RoomController {

    @Autowired
    RoomService roomService;

    // 채팅방 목록 화면
    @RequestMapping("/chatListView")
    public String chatListView(Model model) {
        List<RoomDTO> roomList = roomService.getRoomList();
        model.addAttribute("roomList", roomList);

        // 현재 접속자 수를 추가하여 JSP에 전달
        model.addAttribute("activeUsers", ActiveUserCounter.getActiveSessions());

        return "chat/chatListView";
    }

    // 채팅방 생성 화면
    @RequestMapping("/roomCreateView")
    public String roomCreateView(Model model, HttpSession session) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");

        if (login == null) {
            return "member/loginView";
        }
        return "chat/roomCreateView";
    }

    // 채팅방 생성
    @RequestMapping("/roomCreateDo")
    public String roomCreateDo(RoomDTO room, HttpSession session) {
        System.out.println(room);
        MemberDTO login = (MemberDTO) session.getAttribute("login");

        if (login == null) {
            return "redirect:/loginView";
        }

        room.setMemId(login.getMemId());
        room.setMemName(login.getMemName());
        roomService.createRoom(room);

        return "redirect:/chatListView";
    }

    // 채팅방 삭제 로직
    @RequestMapping("/deleteRoom")
    public String deleteRoom(int roomNo) {
        roomService.deleteRoom(roomNo);
        return "redirect:/chatListView"; // 삭제 후 채팅방 목록으로 리다이렉트
    }
    
    @Autowired
    private ChatLogService chatLogService;  // ChatLogService를 통해 대화 삭제
    
    @ResponseBody
    @PostMapping("/clearChat")
    public String clearChat(int roomNo, HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("login");
        RoomDTO room = roomService.getRoom(roomNo);

        // 방장 또는 admin만 삭제 가능
        if (loginUser != null && (loginUser.getMemId().equals(room.getMemId()) || loginUser.getMemId().equals("admin"))) {
            chatLogService.clearChatLogs(roomNo);  // 대화 삭제 로직 호출
            return "success";
        }
        return "fail";
    }
}
