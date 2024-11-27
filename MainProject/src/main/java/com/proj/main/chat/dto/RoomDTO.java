package com.proj.main.chat.dto;

public class RoomDTO {
    private int roomNo;
    private String roomName;
    private String memId;
    private String memName;
    private String regDate;
    private String delYn;
	public RoomDTO() {
		super();
	}
	public RoomDTO(int roomNo, String roomName, String memId, String memName, String regDate, String delYn) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.memId = memId;
		this.memName = memName;
		this.regDate = regDate;
		this.delYn = delYn;
	}
	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", roomName=" + roomName + ", memId=" + memId + ", memName=" + memName
				+ ", regDate=" + regDate + ", delYn=" + delYn + "]";
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
        this.memId = (memId == null) ? "" : memId; // null일 경우 빈 문자열로 설정
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


}
