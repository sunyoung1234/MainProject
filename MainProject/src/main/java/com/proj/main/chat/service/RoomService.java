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
	    RoomDTO room = dao.getRoom(roomNo);  // DB���� �� ������ �������� �ڵ�
	    return room;
	}
	
	public int createRoom(String roomName, String memName, String memId) {
	    System.out.println("ä�ù� ���� ��û: " + roomName + ", " + memName + ", " + memId);  // �α� �߰�

	    // memId�� �θ� ���̺� �����ϴ��� Ȯ���ϴ� ���� �߰�
	    boolean memExists = checkIfMemIdExists(memId);
	    if (!memExists) {
	        throw new IllegalArgumentException("memId�� �θ� ���̺� �������� �ʽ��ϴ�.");
	    }

	    RoomDTO room = new RoomDTO();
	    room.setRoomName(roomName);
	    room.setMemName(memName);
	    room.setMemId(memId);

	    return dao.createRoom(room);  // DAO���� createRoom ȣ��
	}

	private boolean checkIfMemIdExists(String memId) {
	    // memId�� �θ� ���̺� �����ϴ��� Ȯ���ϴ� ���� (DB ��ȸ)
	    // ���� ���, members ���̺��� memId�� �����ϴ��� Ȯ��
	    // �� �κ��� ���� DB���� memId ���� ���θ� üũ�ϴ� �������� �����ؾ� �մϴ�.
	    return true;  // ������ �����ϴ��� Ȯ���ϴ� �������� ��ü
	}
	
	
	public int deleteRoom(int roomNo) {
		int result = dao.deleteRoom(roomNo);
		return result;
	};
	
	public RoomDTO getRoomByMemId(String memId) {
	    return dao.getRoomByMemId(memId);  // DB���� memId�� �ش� ä�ù��� ã�� ��ȯ
	}
}
