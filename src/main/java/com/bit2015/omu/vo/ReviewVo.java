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
   private String memberId;
   private List<ContentVo> contentList = new ArrayList<ContentVo>();
   private long totalCost;
   private long totalTime;
   private int goodCnt;
   
   public long getBoard_no() {
      return board_no;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
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
            + ", memberId=" + memberId + ", contentList=" + contentList
            + ", totalCost=" + totalCost + ", totalTime=" + totalTime
            + ", goodCnt=" + goodCnt + "]";
   }
   
}
