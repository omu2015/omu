package com.bit2015.omu.vo;

import java.util.ArrayList;
import java.util.List;

public class WriteBoardViewVo {
	private long member_no;
    private long board_no;
    private long plan_no;
    private String memberId;
    private List<ContentVo> contentList = new ArrayList<ContentVo>();
    private long totalCost;
    private long totalTime;
    private long goodCnt;
	
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
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public List<ContentVo> getContentList() {
		return contentList;
	}
	public void setContentList(List<ContentVo> contentList) {
		this.contentList = contentList;
	}
	public long getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(long totalCost) {
		this.totalCost = totalCost;
	}
	public long getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(long totalTime) {
		this.totalTime = totalTime;
	}
	public long getGoodCnt() {
		return goodCnt;
	}
	public void setGoodCnt(long goodCnt) {
		this.goodCnt = goodCnt;
	}
	@Override
	public String toString() {
		return "WriteBoardViewVo [member_no=" + member_no + ", board_no="
				+ board_no + ", plan_no=" + plan_no + ", memberId=" + memberId
				+ ", contentList=" + contentList + ", totalCost=" + totalCost
				+ ", totalTime=" + totalTime + ", goodCnt=" + goodCnt + "]";
	}
    
    
}
