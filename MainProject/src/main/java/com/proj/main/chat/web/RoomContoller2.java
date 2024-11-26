package com.proj.main.chat.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.chat.dto.RoomDTO;
import com.proj.main.chat.service.Room2Service;
import com.proj.main.chat.service.RoomService;

@Controller
public class RoomContoller2 {

	@Autowired
    RoomService roomService;
	
	@Autowired
	Room2Service r2s;
	
	@RequestMapping("/connect-agent")
    @ResponseBody
    public RoomDTO connectAgent(@RequestBody Map<String, Object> requestData) {
        String memId = (String) requestData.get("memId");
        String memName = (String) requestData.get("memName");
        
        Map<String, String> response = new HashMap<>();
        RoomDTO room = new RoomDTO();
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        String roomName = memName + sdf.format(date);
        
        room.setMemId(memId);
        room.setMemName(memName);
        room.setRoomName(roomName);
        
        roomService.createRoom(room);
        
        RoomDTO room2 = r2s.getRoomByName(roomName);
        
        


        return room2;
    }
}
