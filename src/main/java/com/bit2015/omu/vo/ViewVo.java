package com.bit2015.omu.vo;

public class ViewVo {

	private long contentBox_no;
	private long member_no;
	private String memberName;
	private long plan_no;
	private String title;
	private String longitude;
	private String latitude;
	private long cost;
	private long time;
	private long totalCost;
	private long totalTime;
	
	public long getContentBox_no() {
		return contentBox_no;
	}
	public void setContentBox_no(long contentBox_no) {
		this.contentBox_no = contentBox_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public long getCost() {
		return cost;
	}
	public void setCost(long cost) {
		this.cost = cost;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
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
		return "ViewVo [contentBox_no=" + contentBox_no + ", member_no="
				+ member_no + ", memberName=" + memberName + ", plan_no="
				+ plan_no + ", title=" + title + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", cost=" + cost + ", time="
				+ time + ", totalCost=" + totalCost + ", totalTime="
				+ totalTime + "]";
	}
}
