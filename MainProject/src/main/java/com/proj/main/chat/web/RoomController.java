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
    @RequestMapping("/roomCreateDo")
    public String roomCreateDo(RoomDTO room, HttpSession session) {
        System.out.println(room);
        
        MemberDTO login = (MemberDTO)session.getAttribute("login");
        
        if (login == null) {
            return "redirect:/loginView";
        }
        
        room.setMemId(login.getMemId());
        room.setMemName(login.getMemName());
        
        roomService.createRoom(room);  // ä�ù� ���� ���� ȣ��
        
        return "redirect:/chatbot";  // ä�ù� ����� �����ִ� ȭ������ �����̷���
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
