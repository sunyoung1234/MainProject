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
	
	public int createRoom(RoomDTO room) {
		int result = dao.createRoom(room);
		return result;
	};
	
	
	public int deleteRoom(int roomNo) {
		int result = dao.deleteRoom(roomNo);
		return result;
	};
	
	public RoomDTO getRoomByName(String roomName) {
		return dao.getRoomByName(roomName);
	}
	
	public  RoomDTO getRoomByMemId(String memId) {
		return dao.getRoomByMemId(memId);
	}
	
	public int updateLastMsg(RoomDTO room) {
		return dao.updateLastMsg(room);
	}
	
	public int updateUnreadCount(RoomDTO room) {
		return dao.updateUnreadCount(room);
	}
	
	public int updateUserUnread(RoomDTO room) {
		return dao.updateUserUnread(room);
	}
	
	public int delRoom(int roomNo) {
		return dao.delRoom(roomNo);
	}
}
