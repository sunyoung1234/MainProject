package com.proj.main.chat.dto;

public class ChatLogDTO {

    private int chatNo;         /* 채팅로그 식별번호 PK */
    private String memId;       /* 작성자 아이디 */
    private String memName;     /* 작성자 닉네임 */
    private int roomNo;         /* 채팅방 번호 */
    private String chatMsg;     /* 채팅 메시지 내용 */
    private String sendDate;    /* 메시지 날짜 */
    private String readYn;    /* 읽음 여부 */
    
	public ChatLogDTO() {
		super();
	}
	public ChatLogDTO(int chatNo, String memId, String memName, int roomNo, String chatMsg, String sendDate,
			String readYn) {
		super();
		this.chatNo = chatNo;
		this.memId = memId;
		this.memName = memName;
		this.roomNo = roomNo;
		this.chatMsg = chatMsg;
		this.sendDate = sendDate;
		this.readYn = readYn;
	}
	@Override
	public String toString() {
		return "ChatLogDTO [chatNo=" + chatNo + ", memId=" + memId + ", memName=" + memName + ", roomNo=" + roomNo
				+ ", chatMsg=" + chatMsg + ", sendDate=" + sendDate + ", readYn=" + readYn + "]";
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
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
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getChatMsg() {
		return chatMsg;
	}
	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
    
	

    
}
