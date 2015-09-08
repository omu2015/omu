package com.bit2015.omu.vo;

public class BoardVo {
	
	private long board_no;
	private long plan_no;
	private long member_no;
	private String messages;
	private String regDate;
	public long getBoard_no() {
		return board_no;
	}
	public void setBoard_no(long board_no) {
		this.board_no = board_no;
	}
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardVo [board_no=" + board_no + ", plan_no=" + plan_no
				+ ", member_no=" + member_no + ", messages=" + messages
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	
}
