package com.proj.main.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.chat.dto.RoomDTO;


@Mapper
public interface IRoomDAO {
	
	// 채팅방 목록 가져오기
	public List<RoomDTO> getRoomList();

	// 해당 채팅방 정보 가져오기
	public RoomDTO getRoom(int roomNo);
	
	// 채팅방 생성하기
	public int createRoom(RoomDTO room);
	
	// 채팅방 삭제하기
	public int deleteRoom(int roomNo);
	
	// memId가 members 테이블에 존재하는지 확인하는 메서드
    public boolean checkMemIdExists(String memId);
    
 // memId로 채팅방을 찾는 메서드 추가
    RoomDTO getRoomByMemId(String memId);
}
