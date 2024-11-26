package com.proj.main.chat.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.chat.dto.RoomDTO;

@Mapper
public interface IRoom2DAO {

	RoomDTO getRoomByName(String roomName);
}
