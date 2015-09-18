package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.List;

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
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
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
    ProductDao  productDao;
    @Autowired
    ThemeBoxDao themeBoxDao;
    @Autowired
    ThemeDao themeDao;
    
    FileUploader ful=new FileUploader();
    
    public void index(Model model) {
    	List<ReviewVo> reviewList=getReviewList();
    	
    	model.addAttribute("reviewList", reviewList);
     }

   public void pickTheme(Model model, HttpSession session) {
      List<ThemeVo> memberTheme = new ArrayList<ThemeVo>();
      MemberVo memberVo =(MemberVo) session.getAttribute("authUser");
      List<ThemeBoxVo> themeBoxList = themeBoxDao.selectAllByMm(memberVo.getMember_no());
      
      for (int i = 0; i < themeBoxList.size(); i++) {
    	  memberTheme.add(themeDao.selectVo(themeBoxList.get(i).getTheme_no()));
      }
      
      //model
      model.addAttribute("memberTheme", memberTheme);
   }
   
   
   
   
   
   
/*   public void mapview(Model model, HttpSession session){
      //1.session 생성
      MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
      //System.out.println(memberVo.toString());
      //Error 500-> session이 없을 시...
      
      //2.themeBox 다 가져오기
      List<ThemeBoxVo> list=themeBoxDao.selectAll();
      //System.out.println("list.toString()="+list.toString());
      
      //3.임시 arraylist 생성 후 가입한 회원의 관심사 목록을 가져옴
      List<ThemeBoxVo> list2=new ArrayList<ThemeBoxVo>();
      for (int i = 0; i < list.size(); i++) {
         if(list.get(i).getMember_no()==memberVo.getMember_no()){
            //System.out.println("list.get(i)="+list.get(i));
            list2.add((ThemeBoxVo)list.get(i));
         }
      }
      //4.회원의 관심사를 arraylist에다 넣기
      List<ThemeVo> list3=new ArrayList<ThemeVo>();
      for (int i = 0; i < list2.size(); i++) {
         //System.out.println(themeDao.selectVo(list2.get(i).getTheme_no()).toString());
         list3.add(themeDao.selectVo(list2.get(i).getTheme_no()));
      }
      model.addAttribute("themeArray", list3);
      
      
   }
*/
   public List<PlanVo> getPlanListById(String id) {
      List<PlanVo> planList = new ArrayList<PlanVo>();
      ContentVo contentVo = contentDao.selectVoById(id);
      
      if(contentVo==null){
         System.out.println("해당 id로 아무것도 검색되지 않았습니다.");
         return planList;
      }else{
         List<ContentBoxVo> contentBoxList=contentBoxDao.selectAllById(contentVo.getContent_no());
         for (int i = 0; i < contentBoxList.size(); i++) {
            planList.add(planDao.selectVo(contentBoxList.get(i).getPlan_no()));
         }
         return planList;
      }
   }
   
  
   

   public void showboard(Model model, String str_plan_no){
      Long plan_no=Long.parseLong(str_plan_no);
      
      List<ContentBoxVo> contentBoxList=contentBoxDao.selectAllByPno(plan_no);
      List<ContentVo> contentList2=new ArrayList<ContentVo>();
      for (int i = 0; i < contentBoxList.size(); i++) {
         ContentVo contentVo=contentDao.selectVo(contentBoxList.get(i).getContent_no());
         contentList2.add(contentVo);
      }
      
      String jsonCL = jsonn((ArrayList<?>) contentList2);
      System.out.println("show board jsonCL == " + jsonCL);
      BoardVo boardVo = boardDao.selectVoByPno(plan_no);
      
      
      
      List<ReviewVo> reviewList=getReviewList();
      
      model.addAttribute("boardVo", boardVo);
      model.addAttribute("jsonCL", jsonCL);
      model.addAttribute("reviewList", reviewList);
   }
   
   
   
   
   
   
   
   
   
   
   
   public List<ReviewVo> getReviewList(){
      //게시판 추출
      List<BoardVo> boardList = boardDao.selectAll();
      List<ReviewVo> reviewList = new ArrayList<ReviewVo>();
      for (int i = 0; i < boardList.size(); i++) {
         ReviewVo reviewVo=new ReviewVo();
         
         long board_no=boardList.get(i).getBoard_no();
         long plan_no=boardDao.selectVo(board_no).getPlan_no();
         reviewVo.setMemberId(memberDao.selectVo(planDao.selectVo(plan_no).getMember_no()).getMemberId());
         reviewVo.setBoard_no(board_no);
         reviewVo.setPlan_no(plan_no);
         
         List<ContentVo> contentList=reviewVo.getContentList();
         long totalCost = 0;
         long totalTime = 0;
         int goodCnt = 0;
         
         
         List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(plan_no);
         for (int j = 0; j < contentBoxList.size(); j++) {
            //System.out.println("contentVo to String == == "+contentDao.selectVo(contentBoxList.get(j).getContent_no()).toString());
            ContentVo tempVo=contentDao.selectVo(contentBoxList.get(j).getContent_no());
            //System.out.println("tempVo = = "+tempVo.toString());
            contentList.add(contentDao.selectVo(contentBoxList.get(j).getContent_no()));
         }
         
         for (int k = 0; k < contentList.size(); k++) {
            totalCost += contentList.get(k).getCost();
            totalTime += contentList.get(k).getTime();
            goodCnt += goodDao.selectAllByCno((contentList.get(k).getContent_no())).size();
            
            reviewVo.setTotalCost(totalCost);
            reviewVo.setTotalTime(totalTime);
            reviewVo.setGoodCnt(goodCnt);
         }
         
         reviewList.add(reviewVo);
         //System.out.println("reviewVo.toString()=="+reviewVo.toString());
         
      }//게시판 추출 끝 
      
      return reviewList;
   }


public void createBoard(Model model, HttpSession session) {
	MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
	List<PlanVo> planList = planDao.getUserPlan(memberVo.getMember_no());
	PlanVo planVo=planList.get(0);
	
	List<ContentBoxVo> contentBoxList =contentBoxDao.selectAllByPno(planVo.getPlan_no());
	List<ContentVo> contentList = new ArrayList<ContentVo>();
	for (int i = 0; i < contentBoxList.size(); i++) {
		contentList.add(contentDao.selectVo(contentBoxList.get(i).getContent_no()));
	}
	
	String jsonCL = jsonn((ArrayList<?>) contentList);
	
	List<ReviewVo> reviewList=getReviewList();
	System.out.println("create board jsonCL =======  "  + jsonCL);
	
	
	model.addAttribute("planList", planList);
	model.addAttribute("contentList", contentList);
	model.addAttribute("jsonCL", jsonCL);
	model.addAttribute("planVo", planVo);
	model.addAttribute("reviewList", reviewList);
}

public void insertBoard(BoardVo boardVo, MultipartFile img) {
	
	
	System.out.println("insertboadr boardVo to stirng ===  "  + boardVo.toString());
	/*if(img==null){
		
        imgBoxVo.setImageUrl("");
     }else{
        String member_img_url=ful.upload(img);
        System.out.println("member_img_url = "+member_img_url);
        memberVo.setImageUrl(member_img_url);
     }
     memberDao.insert(memberVo);
     
    */ 
	
}











   
   
public String jsonn(ArrayList<?> list){
	   String jsonn="";
	   
	   ObjectMapper objectMapper = new ObjectMapper();
	      try {
	    	  jsonn =objectMapper.writeValueAsString(list);
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
    	  contentList =objectMapper.writeValueAsString(contentList2);
         System.out.println("json parse="+contentList);
         
      } catch (JsonProcessingException e) {
         System.out.println("json test");
         e.printStackTrace();
      }
	
	
	model.addAttribute("contentList" , contentList);
}

public String getMyCL(String str_plan_no) {
	Long plan_no = Long.parseLong(str_plan_no);
	
	String jsonCL = "";
	
	List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(plan_no);
	List<ContentVo> contentList =new ArrayList<ContentVo>(); 
	for (int i = 0; i < contentBoxList.size(); i++) {
		contentList.add(contentDao.selectVo(contentBoxList.get(i).getContent_no()));
	}	
	jsonCL = jsonn((ArrayList<?>) contentList);
	
	return jsonCL;
}



   
}
            
      
