package com.proj.main.chat.web;

import java.util.List;

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
    @RequestMapping("/roomCreateDo")
    public String roomCreateDo(RoomDTO room, HttpSession session) {
        System.out.println(room);
        
        MemberDTO login = (MemberDTO)session.getAttribute("login");
        
        if (login == null) {
            return "redirect:/loginView";
        }
        
        room.setMemId(login.getMemId());
        room.setMemName(login.getMemName());
        
        roomService.createRoom(room);  // 채팅방 생성 서비스 호출
        
        return "redirect:/chatbot";  // 채팅방 목록을 보여주는 화면으로 리다이렉션
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
