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
@RequestMapping("/main")  // 모든 경로에 /main을 추가
public class RoomController {
    @Autowired
    RoomService roomService;

    // 채팅방 목록 데이터 리턴
    @ResponseBody
    @RequestMapping("/getRoomList")
    public List<RoomDTO> getRoomList() {
        return roomService.getRoomList();  // 채팅방 목록 가져오기
    }

    // 채팅방 생성 요청
    @ResponseBody
    @RequestMapping("/createRoom")
    public Map<String, Object> createRoom(@RequestParam String roomName, @RequestParam String memName, @RequestParam String memId) {
        int roomNo = roomService.createRoom(roomName, memName, memId);  // RoomService 호출하여 방 생성
        Map<String, Object> response = new HashMap<>();
        response.put("roomNo", roomNo);  // 생성된 방 번호 반환
        return response;
    }

    // 채팅방 삭제 요청
    @RequestMapping("/deleteRoom")
    @ResponseBody
    public String deleteRoom(@RequestParam int roomNo) {
        int result = roomService.deleteRoom(roomNo);
        return result > 0 ? "success" : "fail";
    }

    // 채팅방 찾기 (memId로 검색)
    @GetMapping("/getRoomByMemId")
    @ResponseBody
    public ResponseEntity<?> getRoomByMemId(@RequestParam String memId) {
        try {
            RoomDTO room = roomService.getRoomByMemId(memId);  // memId로 채팅방 검색
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


