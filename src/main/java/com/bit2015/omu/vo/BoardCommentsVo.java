package com.bit2015.omu.vo;

public class BoardCommentsVo {
	
	private long boardComments_no;
	private long member_no;
	private long board_no;
	private String regDate;
	private String message;
	
	public long getBoardComments_no() {
		return boardComments_no;
	}
	public void setBoardComments_no(long boardComments_no) {
		this.boardComments_no = boardComments_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public long getBoard_no() {
		return board_no;
	}
	public void setBoard_no(long board_no) {
		this.board_no = board_no;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "BoardCommentsVo [boardComments_no=" + boardComments_no
				+ ", member_no=" + member_no + ", board_no=" + board_no
				+ ", regDate=" + regDate + ", message=" + message + "]";
	}
}
