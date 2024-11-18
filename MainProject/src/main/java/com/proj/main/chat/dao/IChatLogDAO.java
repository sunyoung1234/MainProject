package com.proj.main.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.chat.dto.ChatLogDTO;


@Mapper
public interface IChatLogDAO {
	
	// �ش� ä�ù��� ä�ó��� ��������
	public List<ChatLogDTO> getChatList(int roomNo);
	
	// ä�ó��� DB�� ����
	public int insertChat(ChatLogDTO chatLog);

}




