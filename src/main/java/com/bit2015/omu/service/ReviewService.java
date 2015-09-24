package com.bit2015.omu.service;

import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.dao.BoardCommentsDao;
import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.BoardImgBoxDao;
import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.ImgBoxDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ProductDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.util.FileUploader;
import com.bit2015.omu.vo.BoardCommentsVo;
import com.bit2015.omu.vo.BoardImgBoxVo;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ReviewVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ReviewService {

	@Autowired
	BoardCommentsDao boardCommentsDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	BoardImgBoxDao boardImgBoxDao;
	@Autowired
	CommentsDao commnetsDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	GoodDao goodDao;
	@Autowired
	ImgBoxDao imgBoxDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	ThemeBoxDao themeBoxDao;
	@Autowired
	ThemeDao themeDao;

	FileUploader ful = new FileUploader();

	public void index(Model model) {
		List<ReviewVo> reviewList = getReviewList();

		model.addAttribute("reviewList", reviewList);
	}

	public void pickTheme(Model model, HttpSession session) {
		List<ThemeVo> memberTheme = new ArrayList<ThemeVo>();
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		List<ThemeBoxVo> themeBoxList = themeBoxDao.selectAllByMm(memberVo
				.getMember_no());

		for (int i = 0; i < themeBoxList.size(); i++) {
			ThemeVo themeVo = themeDao.selectVo(themeBoxList.get(i)
					.getTheme_no());
			String[] array = themeVo.getThemeName().split(">");
			themeVo.setThemeName(array[array.length - 1]);
			memberTheme.add(themeVo);
		}

		// model
		model.addAttribute("memberTheme", memberTheme);
	}

	public List<PlanVo> getPlanListById(String id) {
		List<PlanVo> planList = new ArrayList<PlanVo>();
		ContentVo contentVo = contentDao.selectVoById(id);

		if (contentVo == null) {
			System.out.println("해당 id로 아무것도 검색되지 않았습니다.");
			return planList;
		} else {
			List<ContentBoxVo> contentBoxList = contentBoxDao
					.selectAllById(contentVo.getContent_no());
			for (int i = 0; i < contentBoxList.size(); i++) {
				planList.add(planDao.selectVo(contentBoxList.get(i)
						.getPlan_no()));
			}
			return planList;
		}
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

	public List<ReviewVo> getReviewList() {
		// 게시판 추출
		List<BoardVo> boardList = boardDao.selectAll();
		List<ReviewVo> reviewList = new ArrayList<ReviewVo>();
		for (int i = 0; i < boardList.size(); i++) {
			ReviewVo reviewVo = new ReviewVo();

			long board_no = boardList.get(i).getBoard_no();
			long plan_no = boardDao.selectVo(board_no).getPlan_no();
			PlanVo planVo = planDao.selectVo(plan_no);
			reviewVo.setMemberId(memberDao.selectVo(planVo.getMember_no())
					.getMemberId());
			reviewVo.setBoard_no(board_no);
			reviewVo.setPlan_no(plan_no);

			List<ContentVo> contentList = reviewVo.getContentList();
			long totalCost = planVo.getTotalCost();
			long totalTime = planVo.getTotalTime();
			int goodCnt = 0;

			List<ContentBoxVo> contentBoxList = contentBoxDao
					.selectAllByPno(plan_no);
			for (int j = 0; j < contentBoxList.size(); j++) {
				contentList.add(contentDao.selectVo(contentBoxList.get(j)
						.getContent_no()));
			}

			for (int k = 0; k < contentList.size(); k++) {
				if (totalCost == 0)
					totalCost += contentList.get(k).getCost();
				if (totalTime == 0)
					totalTime += contentList.get(k).getTime();
				goodCnt += goodDao.selectAllByCno(
						(contentList.get(k).getContent_no())).size();
				// ///////////
				String[] array = contentList.get(k).getCategory().split(">");
				contentList.get(k).setCategory(array[array.length - 1]);
				// ///////////
				reviewVo.setTotalCost(totalCost);
				reviewVo.setTotalTime(totalTime);
				reviewVo.setGoodCnt(goodCnt);
			}

			reviewList.add(reviewVo);
			// System.out.println("reviewVo.toString()=="+reviewVo.toString());

		}// 게시판 추출 끝

		return reviewList;
	}

	public void createBoard(Model model, HttpSession session, Long plan_no) {

		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		List<PlanVo> planAll = planDao.getUserPlan(memberVo.getMember_no());
		List<PlanVo> planList = new ArrayList<PlanVo>();
		
		for (int i = 0; i < planAll.size(); i++) {
			System.out.println("plan_no"+planAll.get(i).getPlan_no()+"   size ===="+contentBoxDao.selectAllByPno(planAll.get(i).getPlan_no()).size());
			
			if(planHasBoard(planAll.get(i).getPlan_no())){
				continue;
			}else if(contentBoxDao.selectAllByPno(planAll.get(i).getPlan_no()).size()==0){
				continue;
			}else{
				planList.add(planAll.get(i));
			}
		}//for문 끝
		System.out.println("planList.toString()   = =  ="+planList.toString());
		
		PlanVo planVo = new PlanVo();
		List<ContentVo> contentList = new ArrayList<ContentVo>();
		String jsonCL="";
		if(planList.size()!=0){
					if (plan_no == -1) {
						planVo = planList.get(0);
					} else {
						planVo = planDao.selectVo(plan_no);
					}
		
					List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(planVo.getPlan_no());
					for (int i = 0; i < contentBoxList.size(); i++) {
						contentList.add(contentDao.selectVo(contentBoxList.get(i)
								.getContent_no()));
					}
			
					jsonCL = jsonn((ArrayList<?>) contentList);

		}
		
		List<ReviewVo> reviewList = getReviewList();

		model.addAttribute("planList", planList);
		model.addAttribute("contentList", contentList);
		model.addAttribute("jsonCL", jsonCL);
		model.addAttribute("planVo", planVo);
		model.addAttribute("reviewList", reviewList);
	}

	public void insertBoard(Model model, BoardVo boardVo, HttpSession session,
			Long totalCost, Long totalTime, MultipartFile img) {
			if(!planHasBoard(boardVo.getPlan_no()) && boardVo.getPlan_no()!=-1){
			MemberVo memberVo = (MemberVo) session.getAttribute("authUser");

			// plan에 totalcost, totalTime update.
			Long pno = boardVo.getPlan_no();
			PlanVo planVo = planDao.selectVo(pno);
			planVo.setTotalCost(totalCost);
			planVo.setTotalTime(totalTime);
			planDao.update(planVo);

			// board insert.
			boardVo.setMember_no(memberVo.getMember_no());
			boardDao.insert(boardVo);

			// boardImgBox 생성 후 insert.
			BoardImgBoxVo boardImgBoxVo = new BoardImgBoxVo();
			boardImgBoxVo
					.setBoard_no(boardDao.selectVoByPno(pno).getBoard_no());
			// img url 설정
			if (img != null) {
				String img_url = ful.upload(img);
				boardImgBoxVo.setImageUrl(img_url);
				boardImgBoxDao.insert(boardImgBoxVo);
			}
		}

		List<ReviewVo> reviewList = getReviewList();
		model.addAttribute("reviewList", reviewList);
	}

	public String jsonn(ArrayList<?> list) {
		String jsonn = "";

		ObjectMapper objectMapper = new ObjectMapper();
		try {
			jsonn = objectMapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonn;
	}

	public void test(Model model) {

		List<ContentVo> contentList2 = contentDao.selectAll();

		ObjectMapper objectMapper = new ObjectMapper();
		String contentList = "";
		try {
			contentList = objectMapper.writeValueAsString(contentList2);

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		model.addAttribute("contentList", contentList);
	}

	public void insertComment(BoardCommentsVo boardCommentsVo) {
		System.out.println("boardCommentsVo.toString() =====   "
				+ boardCommentsVo.toString());
		boardCommentsDao.insert(boardCommentsVo);
	}

	public void deleteBoard(Long board_no) {
		boardDao.delete(board_no);
	}

	public void good(Long board_no, HttpSession session) {

		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		GoodVo goodVo = new GoodVo();
		goodVo.setMember_no(memberVo.getMember_no());
		List<ContentBoxVo> contentBoxList = contentBoxDao
				.selectAllByPno((boardDao.selectVo(board_no).getPlan_no()));
		for (int i = 0; i < contentBoxList.size(); i++) {
			goodVo.setContent_no(contentBoxList.get(i).getContent_no());
			if (goodDao.selectVoCnoMno(goodVo.getContent_no(),
					goodVo.getMember_no()) == null) {
				System.out.println("좋아요 클릭! __________" + goodVo.toString());
				goodDao.insert(goodVo);
			} else {
				System.out.println("이미 좋아요 눌렀어" + goodVo.toString());
			}
		}

	}

	public void capture(Long board_no, HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		PlanVo planVo = new PlanVo();
		planVo.setMember_no(memberVo.getMember_no());

		// 날짜
		/*
		 * DateFormat df=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss"); Date
		 * today=Calendar.getInstance().getTime();
		 * planVo.setPlanDate(df.format(today));
		 */
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String s = formatter.format(new Date());
		planVo.setPlanDate(s);

		// planDao insert
		planDao.insert(planVo);
		// pno뽑기
		List<PlanVo> planList = planDao.getUserPlan(memberVo.getMember_no());
		// order by desc 이므로 0번째 인덱스가 가장 최신
		PlanVo lastplan = planList.get(0);

		ContentBoxVo contentBoxVo = new ContentBoxVo();
		contentBoxVo.setPlan_no(lastplan.getPlan_no());

		List<ContentBoxVo> contentBoxList = contentBoxDao
				.selectAllByPno(boardDao.selectVo(board_no).getPlan_no());
		for (int i = 0; i < contentBoxList.size(); i++) {
			contentBoxVo.setContent_no(contentBoxList.get(i).getContent_no());
			System.out.println("contentBoxDao 에 insert  ___  "
					+ contentBoxVo.toString());
			contentBoxDao.insert(contentBoxVo);

		}
	}
	
	public boolean planHasBoard(Long plan_no){
		if(boardDao.selectVoByPno(plan_no) != null){
			return true;
		}else{
			return false;
		}
	}
	
//	private double distance(double lat1, double lng1, double lat2, double lng2){
//		double theta=lng1-lng2;
//		double dist=Math.sin(deg2rad(lat1))*Math.sin(deg2rad(lat2))
//				+Math.cos(deg2rad(lat1))
//				*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta));
//
//		dist=Math.acos(dist);
//		dist=rad2deg(dist);
//		dist=dist*60*1.1515;
//		dist=dist*1.609344;
//		return (dist);
//	}
//	
//	private double rad2deg(double rad){
//		return (rad*180.0/Math.PI);
//	}
//	
//	private double deg2rad(double deg){
//		return (deg*Math.PI/180.0);
//	}

	public List<ContentVo> getNear(Double lat, Double lng, Double d) {
		List<ContentVo> contentList = contentDao.selectAllNear(lat, lng, d);
		return contentList;
	}
	
}// review Service

