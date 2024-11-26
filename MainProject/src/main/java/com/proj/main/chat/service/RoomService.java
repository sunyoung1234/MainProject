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
	    RoomDTO room = dao.getRoom(roomNo);  // DB에서 방 정보를 가져오는 코드
	    return room;
	}
	
	public int createRoom(String roomName, String memName, String memId) {
	    System.out.println("채팅방 생성 요청: " + roomName + ", " + memName + ", " + memId);  // 로그 추가

	    // memId가 부모 테이블에 존재하는지 확인하는 로직 추가
	    boolean memExists = checkIfMemIdExists(memId);
	    if (!memExists) {
	        throw new IllegalArgumentException("memId가 부모 테이블에 존재하지 않습니다.");
	    }

	    RoomDTO room = new RoomDTO();
	    room.setRoomName(roomName);
	    room.setMemName(memName);
	    room.setMemId(memId);

	    return dao.createRoom(room);  // DAO에서 createRoom 호출
	}

	private boolean checkIfMemIdExists(String memId) {
	    // memId가 부모 테이블에 존재하는지 확인하는 로직 (DB 조회)
	    // 예를 들어, members 테이블에서 memId가 존재하는지 확인
	    // 이 부분은 실제 DB에서 memId 존재 여부를 체크하는 로직으로 구현해야 합니다.
	    return true;  // 실제로 존재하는지 확인하는 로직으로 대체
	}
	
	
	public int deleteRoom(int roomNo) {
		int result = dao.deleteRoom(roomNo);
		return result;
	};
	
	public RoomDTO getRoomByMemId(String memId) {
	    return dao.getRoomByMemId(memId);  // DB에서 memId로 해당 채팅방을 찾아 반환
	}
}
