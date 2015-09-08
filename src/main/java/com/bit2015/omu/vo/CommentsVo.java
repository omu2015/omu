package com.bit2015.omu.vo;

public class CommentsVo {
	
	private long comments_no;
	private long member_no;
	private long content_no;
	private String regDate;
	private String message;
	public long getComments_no() {
		return comments_no;
	}
	public void setComments_no(long comments_no) {
		this.comments_no = comments_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
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
		return "CommentsVo [comments_no=" + comments_no + ", member_no="
				+ member_no + ", content_no=" + content_no + ", regDate="
				+ regDate + ", message=" + message + "]";
	}

	
	

}
