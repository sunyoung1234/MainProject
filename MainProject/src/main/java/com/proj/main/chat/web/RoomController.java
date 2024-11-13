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
import com.proj.main.ActiveUserCounter; // ActiveUserCounter Ŭ���� ����Ʈ

@Controller
public class RoomController {

    @Autowired
    RoomService roomService;

    // ä�ù� ��� ȭ��
    @RequestMapping("/chatListView")
    public String chatListView(Model model) {
        List<RoomDTO> roomList = roomService.getRoomList();
        model.addAttribute("roomList", roomList);

        // ���� ������ ���� �߰��Ͽ� JSP�� ����
        model.addAttribute("activeUsers", ActiveUserCounter.getActiveSessions());

        return "chat/chatListView";
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
        MemberDTO login = (MemberDTO) session.getAttribute("login");

        if (login == null) {
            return "redirect:/loginView";
        }

        room.setMemId(login.getMemId());
        room.setMemName(login.getMemName());
        roomService.createRoom(room);

        return "redirect:/chatListView";
    }

    // ä�ù� ���� ����
    @RequestMapping("/deleteRoom")
    public String deleteRoom(int roomNo) {
        roomService.deleteRoom(roomNo);
        return "redirect:/chatListView"; // ���� �� ä�ù� ������� �����̷�Ʈ
    }
    
    @Autowired
    private ChatLogService chatLogService;  // ChatLogService�� ���� ��ȭ ����
    
    @ResponseBody
    @PostMapping("/clearChat")
    public String clearChat(int roomNo, HttpSession session) {
        MemberDTO loginUser = (MemberDTO) session.getAttribute("login");
        RoomDTO room = roomService.getRoom(roomNo);

        // ���� �Ǵ� admin�� ���� ����
        if (loginUser != null && (loginUser.getMemId().equals(room.getMemId()) || loginUser.getMemId().equals("admin"))) {
            chatLogService.clearChatLogs(roomNo);  // ��ȭ ���� ���� ȣ��
            return "success";
        }
        return "fail";
    }
}
