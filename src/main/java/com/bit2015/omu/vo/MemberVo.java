package com.bit2015.omu.vo;

public class MemberVo {
	private long member_no;
	private String memberId;
	private String memberName;
	private String password;
	private String email;
	private String imageURL;
	private String memberGrade;
	private String memberStatus;
	private String birth;
	private String zipCode;
	private String address;
	private String phoneNum1;
	private String phoneNum2;
	private String phoneNum3;
	private String joinDate;
	private String joinOutDate;
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNum1() {
		return phoneNum1;
	}
	public void setPhoneNum1(String phoneNum1) {
		this.phoneNum1 = phoneNum1;
	}
	public String getPhoneNum2() {
		return phoneNum2;
	}
	public void setPhoneNum2(String phoneNum2) {
		this.phoneNum2 = phoneNum2;
	}
	public String getPhoneNum3() {
		return phoneNum3;
	}
	public void setPhoneNum3(String phoneNum3) {
		this.phoneNum3 = phoneNum3;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinOutDate() {
		return joinOutDate;
	}
	public void setJoinOutDate(String joinOutDate) {
		this.joinOutDate = joinOutDate;
	}
	@Override
	public String toString() {
		return "MemberVo [member_no=" + member_no + ", memberId=" + memberId
				+ ", memberName=" + memberName + ", password=" + password
				+ ", email=" + email + ", imageURL=" + imageURL
				+ ", memberGrade=" + memberGrade + ", memberStatus="
				+ memberStatus + ", birth=" + birth + ", zipCode=" + zipCode
				+ ", address=" + address + ", phoneNum1=" + phoneNum1
				+ ", phoneNum2=" + phoneNum2 + ", phoneNum3=" + phoneNum3
				+ ", joinDate=" + joinDate + ", joinOutDate=" + joinOutDate
				+ "]";
	}
	
	

}
