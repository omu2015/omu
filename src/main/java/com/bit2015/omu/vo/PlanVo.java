package com.bit2015.omu.vo;

public class PlanVo {
	
	private long plan_no;
	private long member_no;
	private String planDate;
	private long totalCost;
	private long totalTime;


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


	public String getPlanDate() {
		return planDate;
	}


	public void setPlanDate(String planDate) {
		this.planDate = planDate;
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


	@Override
	public String toString() {
		return "PlanVo [plan_no=" + plan_no + ", member_no=" + member_no
				+ ", planDate=" + planDate + ", totalCost=" + totalCost
				+ ", totalTime=" + totalTime + "]";
	}
	
	

}
