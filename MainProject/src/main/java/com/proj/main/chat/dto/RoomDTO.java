package com.proj.main.chat.dto;

public class RoomDTO {
    private int roomNo;
    private String roomName;
    private String memId;
    private String memName;
    private String regDate;
    private String delYn;
    private int unreadCount;
    private String lastMessage; // 마지막 메시지 내용
    private String lastMessageTime; // 마지막 메시지 시간
    private int userUnreadCount;
    
	public RoomDTO() {
		super();
	}

	public RoomDTO(int roomNo, String roomName, String memId, String memName, String regDate, String delYn,
			int unreadCount, String lastMessage, String lastMessageTime, int userUnreadCount) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.memId = memId;
		this.memName = memName;
		this.regDate = regDate;
		this.delYn = delYn;
		this.unreadCount = unreadCount;
		this.lastMessage = lastMessage;
		this.lastMessageTime = lastMessageTime;
		this.userUnreadCount = userUnreadCount;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", roomName=" + roomName + ", memId=" + memId + ", memName=" + memName
				+ ", regDate=" + regDate + ", delYn=" + delYn + ", unreadCount=" + unreadCount + ", lastMessage="
				+ lastMessage + ", lastMessageTime=" + lastMessageTime + ", userUnreadCount=" + userUnreadCount + "]";
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public int getUnreadCount() {
		return unreadCount;
	}

	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}

	public String getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

	public String getLastMessageTime() {
		return lastMessageTime;
	}

	public void setLastMessageTime(String lastMessageTime) {
		this.lastMessageTime = lastMessageTime;
	}

	public int getUserUnreadCount() {
		return userUnreadCount;
	}

	public void setUserUnreadCount(int userUnreadCount) {
		this.userUnreadCount = userUnreadCount;
	}

	

	
	


}
