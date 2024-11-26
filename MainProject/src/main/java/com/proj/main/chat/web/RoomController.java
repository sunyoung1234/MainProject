package com.proj.main.chat.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.RoomService;

@Controller
@RequestMapping("/main")  // ��� ��ο� /main�� �߰�
public class RoomController {
    @Autowired
    RoomService roomService;

    // ä�ù� ��� ������ ����
    @ResponseBody
    @RequestMapping("/getRoomList")
    public List<RoomDTO> getRoomList() {
        return roomService.getRoomList();  // ä�ù� ��� ��������
    }

    // ä�ù� ���� ��û
    @ResponseBody
    @RequestMapping("/createRoom")
    public Map<String, Object> createRoom(@RequestParam String roomName, @RequestParam String memName, @RequestParam String memId) {
        int roomNo = roomService.createRoom(roomName, memName, memId);  // RoomService ȣ���Ͽ� �� ����
        Map<String, Object> response = new HashMap<>();
        response.put("roomNo", roomNo);  // ������ �� ��ȣ ��ȯ
        return response;
    }

    // ä�ù� ���� ��û
    @RequestMapping("/deleteRoom")
    @ResponseBody
    public String deleteRoom(@RequestParam int roomNo) {
        int result = roomService.deleteRoom(roomNo);
        return result > 0 ? "success" : "fail";
    }

    // ä�ù� ã�� (memId�� �˻�)
    @GetMapping("/getRoomByMemId")
    @ResponseBody
    public ResponseEntity<?> getRoomByMemId(@RequestParam String memId) {
        try {
            RoomDTO room = roomService.getRoomByMemId(memId);  // memId�� ä�ù� �˻�
            if (room != null) {
                return ResponseEntity.ok(room);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Room not found");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching room");
        }
    }
}


