package com.bit2015.omu.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;

public class ReviewVo {

	private long board_no;
	private long plan_no;
	private List<ContentVo> contentList = new ArrayList<ContentVo>();
	private long totalCost;
	private long totalTime;
	private int goodCnt;
	
/*	@Autowired
	ContentDao contentDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	GoodDao goodDao;
	
	public ReviewVo(Long board_no){
		this.board_no=board_no;
		System.out.println("board_no="+board_no);
		System.out.println("boardao tostring="+boardDao.selectVo(board_no).toString());
		this.plan_no=boardDao.selectVo(board_no).getPlan_no();
		
		List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(plan_no);
		for (int i = 0; i < contentBoxList.size(); i++) {
			this.contentList.add(contentDao.selectVo(contentBoxList.get(i).getContent_no()));
		}
		
		for (int i = 0; i < this.contentList.size(); i++) {
			this.totalCost += contentList.get(i).getCost();
			this.totalTime += contentList.get(i).getTime();
		}
		
		for (int i = 0; i < this.contentList.size(); i++) {
			this.goodCnt += goodDao.selectAllByCno((contentList.get(i).getContent_no())).size();
		}
		
	}*/

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

	public int getGoodCnt() {
		return goodCnt;
	}

	public void setGoodCnt(int goodCnt) {
		this.goodCnt = goodCnt;
	}

	@Override
	public String toString() {
		return "ReviewVo [board_no=" + board_no + ", plan_no=" + plan_no
				+ ", contentList=" + contentList + ", totalCost=" + totalCost
				+ ", totalTime=" + totalTime + ", goodCnt=" + goodCnt + "]";
	}
}
