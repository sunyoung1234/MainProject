package com.proj.main.chat.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.RoomService;
import com.proj.main.member.dto.MemberDTO;


@Controller
public class RoomController {
    
    @Autowired
    RoomService roomService;
    
    // 채팅방 목록 데이터 리턴
    @ResponseBody
    @RequestMapping("/getRoomList")
    public List<RoomDTO> chatListView(Model model) {
        List<RoomDTO> roomList = roomService.getRoomList();  // 채팅방 목록 가져오기
        
        return roomList;  
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
    @RequestMapping("/createRoom")
    @ResponseBody
    public Map<String, Object> createRoom(@RequestParam String roomName, @RequestParam String memName) {
        int roomNo = roomService.createRoom(roomName, memName);  // RoomService 호출하여 방 생성
        Map<String, Object> response = new HashMap<>();
        response.put("roomNo", roomNo);  // 생성된 방 번호 반환
        return response;
    }
    
    // 채팅방 삭제 요청 처리
    @PostMapping("/deleteRoom")
    @ResponseBody
    public String deleteRoom(@RequestParam int roomNo) {
        int result = roomService.deleteRoom(roomNo);
        if (result > 0) {
            return "success";
        } else {
            return "fail";
        }
    }
    
}
