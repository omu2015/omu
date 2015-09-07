package com.bit2015.omu.vo;

public class GoodVo {
	
	private long good_no;
	private long content_no;
	private long member_no;
	
	public long getGood_no() {
		return good_no;
	}
	public void setGood_no(long good_no) {
		this.good_no = good_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	
	@Override
	public String toString() {
		return "GoodVo [good_no=" + good_no + ", content_no=" + content_no
				+ ", member_no=" + member_no + "]";
	}
	
	

}
