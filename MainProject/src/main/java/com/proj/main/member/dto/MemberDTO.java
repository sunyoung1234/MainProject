package com.proj.main.member.dto;

public class MemberDTO {
    private String memId;
    private String memPw;
    private String memEmail;
    private String memPhone;
    private String memName;
    private String memProfile;
    private String memAddress;
    private String memDetailAddress;
    private String postcode;
    private String extraAddress;
    private int memLevel;
    
    
    public MemberDTO() {
    }

    

	public MemberDTO(String memId, String memPw, String memEmail, String memPhone, String memName, String memProfile,
			String memAddress, String memDetailAddress, String postcode, String extraAddress, int memLevel) {
		this.memId = memId;
		this.memPw = memPw;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.memName = memName;
		this.memProfile = memProfile;
		this.memAddress = memAddress;
		this.memDetailAddress = memDetailAddress;
		this.postcode = postcode;
		this.extraAddress = extraAddress;
		this.memLevel = memLevel;
	}



	@Override
	public String toString() {
		return "MemberDTO [memId=" + memId + ", memPw=" + memPw + ", memEmail=" + memEmail + ", memPhone=" + memPhone
				+ ", memName=" + memName + ", memProfile=" + memProfile + ", memAddress=" + memAddress
				+ ", memDetailAddress=" + memDetailAddress + ", postcode=" + postcode + ", extraAddress=" + extraAddress
				+ ", memLevel=" + memLevel + "]";
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



	public String getMemEmail() {
		return memEmail;
	}



	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}



	public String getMemPhone() {
		return memPhone;
	}



	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}



	public String getMemName() {
		return memName;
	}



	public void setMemName(String memName) {
		this.memName = memName;
	}



	public String getMemProfile() {
		return memProfile;
	}



	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}



	public String getMemAddress() {
		return memAddress;
	}



	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}



	public String getMemDetailAddress() {
		return memDetailAddress;
	}



	public void setMemDetailAddress(String memDetailAddress) {
		this.memDetailAddress = memDetailAddress;
	}



	public String getPostcode() {
		return postcode;
	}



	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}



	public String getExtraAddress() {
		return extraAddress;
	}



	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}



	public int getMemLevel() {
		return memLevel;
	}



	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

    
    
}
