package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.dao.BoardCommentsDao;
import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.BoardImgBoxDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.util.FileUploader;
import com.bit2015.omu.vo.BoardCommentsVo;
import com.bit2015.omu.vo.BoardImgBoxVo;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.CalendarVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodViewVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ReviewVo;
import com.bit2015.omu.vo.ThemeVo;
import com.bit2015.omu.vo.WriteBoardViewVo;

@Service
public class MyPageService {
	@Autowired
	MemberDao memberDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	GoodDao goodDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	BoardImgBoxDao boardImgBoxDao;
	@Autowired
	BoardCommentsDao boardCommentsDao;
	
	
	FileUploader ful=new FileUploader();
	 

	/* 회원수정 */
	public void memberModify(HttpSession session,
			@ModelAttribute MemberVo memberVo, String repassword,
			String password1 ,MultipartFile img) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberName(memberVo.getMemberName());
			vo.setAddress(memberVo.getAddress());
		   /* vo.setPassword(repassword);*/
			String member_img_url=ful.upload(img);
			System.out.println("member_img_url===="+member_img_url);
			if(member_img_url!=""){
			vo.setImageUrl(member_img_url);
			}
			if(repassword !=""){
				vo.setPassword(password1);
			}else{
				vo.setPassword(repassword);
			}
			vo.setPhoneNum1(memberVo.getPhoneNum1());
			vo.setPhoneNum2(memberVo.getPhoneNum2());
			vo.setPhoneNum3(memberVo.getPhoneNum3());
			vo.setEmail(memberVo.getEmail());
			vo.setZipcode(memberVo.getZipcode());
			memberDao.update(vo);
			System.out.println(vo);
		}
	}
    // 회원탈퇴
	public void memberLeave(HttpSession session, @ModelAttribute MemberVo memberVo, String password1 ,String joinOutDate ) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberVo);
		
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberStatus(memberVo.getMemberStatus());
			
			memberDao.memberLeave(vo);
			System.out.println(vo);
		} else {
			System.out.println("비번이 서로 달라");

		}
	}
    //먹놀자 달력
	public List<CalendarVo> selectView(){
		List<CalendarVo> viewList = new ArrayList<CalendarVo>();
		List<ContentBoxVo> contentBoxList = contentBoxDao.selectAll();
		List<ContentVo> contentList = contentDao.selectAll();
		
		
		for(int i = 0; i<contentBoxList.size();i++){
			CalendarVo calendarVo = new CalendarVo();
			long content_no = contentBoxList.get(i).getContent_no();
			long contentBox_no = contentBoxList.get(i).getContentBox_no();
			long plan_no = contentBoxList.get(i).getPlan_no();  
			long member_no = planDao.selectVo(plan_no).getMember_no();
		 
			calendarVo.setContent_no(content_no);
			calendarVo.setRegDate(contentDao.selectVo(content_no).getRegDate());
			calendarVo.setMember_no(member_no);
			calendarVo.setAddress(contentDao.selectVo(content_no).getAddress());
			calendarVo.setPhone(contentDao.selectVo(content_no).getPhone());
			calendarVo.setNewAddress(contentDao.selectVo(content_no).getNewAddress());
			calendarVo.setImageUrl(contentDao.selectVo(content_no).getImageUrl());
			calendarVo.setDirection(contentDao.selectVo(content_no).getDirection());
			calendarVo.setZipcode(contentDao.selectVo(content_no).getZipcode());
			calendarVo.setPlaceUrl(contentDao.selectVo(content_no).getPlaceUrl());
			calendarVo.setId(contentDao.selectVo(content_no).getId());
			calendarVo.setTitle(contentDao.selectVo(content_no).getTitle());
			calendarVo.setCategory(contentDao.selectVo(content_no).getCategory());
			calendarVo.setAddress(contentDao.selectVo(content_no).getAddress());
			calendarVo.setLongitude(contentDao.selectVo(content_no).getLongitude());
			calendarVo.setLatitude(contentDao.selectVo(content_no).getLatitude());
			calendarVo.setAddressBCode(contentDao.selectVo(content_no).getAddressBCode());
			calendarVo.setCost(contentDao.selectVo(content_no).getCost());
			calendarVo.setTime(contentDao.selectVo(content_no).getTime());
		    calendarVo.setPlanDate(planDao.selectVo(plan_no).getPlanDate());
		    calendarVo.setTotalCost(planDao.selectVo(plan_no).getTotalCost());
		    calendarVo.setTotalTime(planDao.selectVo(plan_no).getTotalTime());
		    calendarVo.setContentBox_no(contentBox_no);
		    calendarVo.setPlan_no(plan_no);
		    viewList.add(i, calendarVo);
			
		}
		return viewList;
	}
	// good 조아요 표시
	public List<GoodViewVo> selectGood(){
		List<GoodViewVo> goodViewList = new ArrayList<GoodViewVo>();
		List<GoodVo> goodList =  goodDao.selectAll();
		//List<ContentVo> contentList = contentDao.selectAll();
		//List<MemberVo>  memberList = memberDao.selectAll();
	   
		int sum = 0;
		long count=0;
		
		for(int i = 0; i<goodList.size();i++){
		GoodViewVo goodViewVo = new GoodViewVo();
			//long good_no= goodList.get(i).getGood_no();
			
			long content_no = goodList.get(i).getContent_no();
			long member_no = goodList.get(i).getMember_no();
		 
			//
			long goodCnt =goodDao.selectAllByCno(content_no).size();
			//
			
			goodViewVo.setContent_no(content_no);
			goodViewVo.setRegDate(contentDao.selectVo(content_no).getRegDate());
			goodViewVo.setMember_no(member_no);
			goodViewVo.setPhone(contentDao.selectVo(content_no).getPhone());
			goodViewVo.setNewAddress(contentDao.selectVo(content_no).getNewAddress());
			goodViewVo.setImageUrl(contentDao.selectVo(content_no).getImageUrl());
			goodViewVo.setDirection(contentDao.selectVo(content_no).getDirection());
			goodViewVo.setZipcode(contentDao.selectVo(content_no).getZipcode());
			goodViewVo.setPlaceUrl(contentDao.selectVo(content_no).getPlaceUrl());
			goodViewVo.setId(contentDao.selectVo(content_no).getId());
			goodViewVo.setTitle(contentDao.selectVo(content_no).getTitle());
			goodViewVo.setCategory(contentDao.selectVo(content_no).getCategory());
			goodViewVo.setAddress(contentDao.selectVo(content_no).getAddress());
			goodViewVo.setLongitude(contentDao.selectVo(content_no).getLongitude());
			goodViewVo.setLatitude(contentDao.selectVo(content_no).getLatitude());
			goodViewVo.setAddressBCode(contentDao.selectVo(content_no).getAddressBCode());
			goodViewVo.setCost(contentDao.selectVo(content_no).getCost());
			goodViewVo.setTime(contentDao.selectVo(content_no).getTime());
			goodViewVo.setGood_no(goodCnt);
			goodViewList.add(i,goodViewVo);
		}
	    System.out.println(count);
		return goodViewList;
	}
	
	// 내가 쓴 게시물 꺼내기
	public List<WriteBoardViewVo> getWriteBoardList(){
		List<BoardVo> boardList = boardDao.selectAll();
		List<WriteBoardViewVo> writeBoardList = new ArrayList<WriteBoardViewVo>();
		List<MemberVo>  memberList = memberDao.selectAll();
		for(int i=0; i<boardList.size();i++){
			WriteBoardViewVo writeBoardViewVo = new WriteBoardViewVo();
			
		    long member_no=boardList.get(i).getMember_no();
		    long board_no=boardList.get(i).getBoard_no();
		    long plan_no=boardList.get(i).getPlan_no();
		    writeBoardViewVo.setMemberId(memberDao.selectVo(member_no).getMemberId());
		    writeBoardViewVo.setMember_no(member_no);
		    writeBoardViewVo.setBoard_no(board_no);
		    writeBoardViewVo.setPlan_no(plan_no);
		    
		    List<ContentVo> contentList = writeBoardViewVo.getContentList();
		    long totalCost = 0;
		    long totalTime = 0;
		    int goodCnt=0;
		    
		    List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(plan_no);
		    for(int j=0; j<contentBoxList.size();j++){
		    	ContentVo tempVo = contentDao.selectVo(contentBoxList.get(j).getContent_no());
		    	contentList.add(contentDao.selectVo(contentBoxList.get(j).getContent_no()));
		    }
		    for (int k = 0; k < contentList.size(); k++) {
	            totalCost += contentList.get(k).getCost();
	            totalTime += contentList.get(k).getTime();
	            goodCnt += goodDao.selectAllByCno((contentList.get(k).getContent_no())).size();
		    
	            writeBoardViewVo.setTotalCost(totalCost);
	            writeBoardViewVo.setTotalTime(totalTime);
	            writeBoardViewVo.setGoodCnt(goodCnt);
		    }
		    writeBoardList.add(writeBoardViewVo);
		}
		 return writeBoardList;
	}
	public Object[] getContentNo(Long plan_no){
		List<ContentBoxVo> list = contentBoxDao.selectAllByPno(plan_no);
		Object[] cntVo = new Object[list.size()];
		for(int i=0; i<list.size(); i++){
			ContentBoxVo contentBoxVo = new ContentBoxVo();
			contentBoxVo = list.get(i);
			cntVo[i] = contentDao.selectVo(contentBoxVo.getContent_no());
		}
		return cntVo;
	}
	
	public void showboard(Model model, Long plan_no) {

		List<ContentBoxVo> contentBoxList = contentBoxDao
				.selectAllByPno(plan_no);
		List<ContentVo> contentList2 = new ArrayList<ContentVo>();
		for (int i = 0; i < contentBoxList.size(); i++) {
			ContentVo contentVo = contentDao.selectVo(contentBoxList.get(i)
					.getContent_no());
			contentList2.add(contentVo);
		}

		String jsonCL = jsonn((ArrayList<?>) contentList2);
		// System.out.println("show board jsonCL == " + jsonCL);
		BoardVo boardVo = boardDao.selectVoByPno(plan_no);
		if(boardVo.getMessage()!=null){
			//엔터키 바까주기
		boardVo.setMessage(boardVo.getMessage().replaceAll("\r\n", "\r\n<br>"));
		}
		PlanVo planVo = planDao.selectVo(plan_no);
		// imgbox 가져오기
		List<BoardImgBoxVo> boardImgBoxList = boardImgBoxDao
				.selectAllByBno(boardVo.getBoard_no());

		// 사용자 아이디 가져오기
		String memberId = memberDao.selectVo(boardVo.getMember_no())
				.getMemberId();

		// 댓글리스트 갖고오기
		Map<String, ArrayList<?>> commentsMap= new HashMap<String, ArrayList<?>>();
		List<BoardCommentsVo> boardCommentsList = boardCommentsDao
				.selectAllByBno(boardVo.getBoard_no());
		commentsMap.put("boardCommentsList", (ArrayList<?>) boardCommentsList);
		// memberList 가져오기
		List<MemberVo> memberList=new ArrayList<MemberVo>();
		for (int i = 0; i < boardCommentsList.size(); i++) {
			memberList.add(memberDao.selectVo(boardCommentsList.get(i).getMember_no()));
		}
		commentsMap.put("memberList", (ArrayList<?>) memberList);
		
		
		//commentsMap.get("boardCommentsList");
		
		
		//reviewList
		List<ReviewVo> reviewList = getReviewList();

		model.addAttribute("commentsMap", commentsMap);
		model.addAttribute("planVo", planVo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("boardImgBoxList", boardImgBoxList);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("jsonCL", jsonCL);
		model.addAttribute("reviewList", reviewList);
	}
	private List<ReviewVo> getReviewList() {
		// TODO Auto-generated method stub
		return null;
	}
	private String jsonn(ArrayList<?> contentList2) {
		// TODO Auto-generated method stub
		return null;
	}

}
