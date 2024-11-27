package com.proj.main.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.chat.dao.IRoomDAO;
import com.proj.main.chat.dto.RoomDTO;

@Service
public class RoomService {

	@Autowired
	IRoomDAO dao;
	
	public List<RoomDTO> getRoomList(){
		List<RoomDTO> result = dao.getRoomList();
		return result;
	};
	
	public RoomDTO getRoom(int roomNo) { 	
		RoomDTO result = dao.getRoom(roomNo);
		return result;
	};
	
	public int createRoom(String roomName, String memName) {
	    RoomDTO room = new RoomDTO();
	    room.setRoomName(roomName);
	    room.setMemName(memName);
	    return dao.createRoom(room);  // DAO에서 createRoom 호출
	}
	
	
	public int deleteRoom(int roomNo) {
		int result = dao.deleteRoom(roomNo);
		return result;
	};
	
	
}
