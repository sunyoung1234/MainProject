package com.proj.main.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.chat.dao.IRoom2DAO;
import com.proj.main.chat.dto.RoomDTO;

@Service
public class Room2Service {

	@Autowired
	IRoom2DAO dao;
	
	public RoomDTO getRoomByName(String roomName) {
		return dao.getRoomByName(roomName);
	}
}
