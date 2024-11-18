package com.proj.main.chat.dto;

public class ChatLogDTO {

    private int chatNo;         /* ä�÷α� �ĺ���ȣ PK */
    private String memId;       /* �ۼ��� ���̵� */
    private String memName;     /* �ۼ��� �г��� */
    private int roomNo;         /* ä�ù� ��ȣ */
    private String chatMsg;     /* ä�� �޽��� ���� */
    private String sendDate;    /* �޽��� ��¥ */

    public ChatLogDTO() {}

    public ChatLogDTO(int chatNo, String memId, String memName, int roomNo, String chatMsg, String sendDate) {
        this.chatNo = chatNo;
        this.memId = memId;
        this.memName = memName;
        this.roomNo = roomNo;
        this.chatMsg = chatMsg;
        this.sendDate = sendDate;
    }

    @Override
    public String toString() {
        return "ChatLogDTO [chatNo=" + chatNo + ", memId=" + memId + ", memName=" + memName + ", roomNo=" + roomNo
                + ", chatMsg=" + chatMsg + ", sendDate=" + sendDate + "]";
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
}
