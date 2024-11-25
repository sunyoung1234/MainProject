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
    
    // ä�ù� ��� ������ ����
    @ResponseBody
    @RequestMapping("/getRoomList")
    public List<RoomDTO> chatListView(Model model) {
        List<RoomDTO> roomList = roomService.getRoomList();  // ä�ù� ��� ��������
        
        return roomList;  
    }

    // ä�ù� ���� ȭ��
    @RequestMapping("/roomCreateView")
    public String roomCreateView(Model model, HttpSession session) {
        
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        
        if (login == null) {
            return "member/loginView";
        }
        
        return "chat/roomCreateView";
    }
    
    // ä�ù� ����
    @RequestMapping("/createRoom")
    @ResponseBody
    public Map<String, Object> createRoom(@RequestParam String roomName, @RequestParam String memName) {
        int roomNo = roomService.createRoom(roomName, memName);  // RoomService ȣ���Ͽ� �� ����
        Map<String, Object> response = new HashMap<>();
        response.put("roomNo", roomNo);  // ������ �� ��ȣ ��ȯ
        return response;
    }
    
    // ä�ù� ���� ��û ó��
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
