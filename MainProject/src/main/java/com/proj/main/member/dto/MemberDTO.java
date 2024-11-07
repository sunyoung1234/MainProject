package com.proj.main.member.dto;

public class MemberDTO {
    private String memId;
    private String memPw;
    private String memName;
    private String memPhone;
    private String memEmail;
    private String memAddress;
    private String memProfile;
    private int memLevel;
    
    public MemberDTO() {
    }

    public MemberDTO(String memId, String memPw, String memName, String memPhone, String memEmail, String memAddress, String memProfile, int memLevel) {
        this.memId = memId;
        this.memPw = memPw;
        this.memName = memName;
        this.memPhone = memPhone;
        this.memEmail = memEmail;
        this.memAddress = memAddress;
        this.memProfile = memProfile;
        this.memLevel = memLevel;
    }


    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPw() {
        return memPw;
    }

    public void setMemPw(String memPw) {
        this.memPw = memPw;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemPhone() {
        return memPhone;
    }

    public void setMemPhone(String memPhone) {
        this.memPhone = memPhone;
    }

    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    public String getMemAddress() {
        return memAddress;
    }

    public void setMemAddress(String memAddress) {
        this.memAddress = memAddress;
    }

    public String getMemProfile() {
        return memProfile;
    }

    public void setMemProfile(String memProfile) {
        this.memProfile = memProfile;
    }

    public int getMemLevel() {
        return memLevel;
    }

    public void setMemLevel(int memLevel) {
        this.memLevel = memLevel;
    }
}
