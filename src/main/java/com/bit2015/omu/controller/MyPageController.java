package com.bit2015.omu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.service.MyPageService;
import com.bit2015.omu.service.PlannerService;
import com.bit2015.omu.service.ReviewService;
import com.bit2015.omu.vo.CalendarVo;
import com.bit2015.omu.vo.GoodViewVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.WriteBoardViewVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	 MyPageService myPageService;
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/membermodifyform")
    public String  memberModifyForm(HttpSession session , @ModelAttribute MemberVo memberVo){
	 MemberVo vo = (MemberVo) session.getAttribute("authUser");
	 return "/mypage/membermodifyform";
  }
	@RequestMapping("/membermodifyformok")
	public String modify(HttpSession session,@ModelAttribute MemberVo memberVo ,String repassword,String password1,MultipartFile img){
	     myPageService.memberModify(session, memberVo,repassword,password1, img);
		return "redirect:/";
	}
	@RequestMapping("memberleave")
	public String memberLeave(HttpSession session , @ModelAttribute MemberVo member){
		MemberVo vo = (MemberVo) session.getAttribute("authUSer");
		return "/mypage/memberleave";		
	}
	@RequestMapping("memberleaveok")
	public String memeberLeaveOk(HttpSession session ,@ModelAttribute MemberVo memberVo, String password1){
	      myPageService.memberLeave(session, memberVo, password1);
	      session.removeAttribute( "authUser" );
			session.invalidate();
			return "redirect:/";
	}
	@RequestMapping("")
	 public String planView(Model model){
		List<CalendarVo> viewList=myPageService.selectView();
		model.addAttribute("viewList", viewList);
		return "/mypage/planview";
	}
	
	@RequestMapping("selectplanview")
    public String selectPlanView(@RequestParam Long plan_no, Model model){
		
		Object[] getContentVo = myPageService.getContentNo(plan_no);
			
			ObjectMapper objectMapper = new ObjectMapper();      
			String jsonCL = "";      
			try {
		    jsonCL =objectMapper.writeValueAsString(getContentVo);
		         
		     } catch (JsonProcessingException e) {  
		    	 e.printStackTrace();    
		    }
			model.addAttribute("contentVo", jsonCL);
	
		return "/mypage/selectplanview";
	}
	
	
	@RequestMapping("goodview")
	public String goodView(Model model){
		List<GoodViewVo> goodViewList = myPageService.selectGood();
		 model.addAttribute("goodViewList", goodViewList);
		return "/mypage/goodview";
	}
	
	@RequestMapping("boardview")
	public String boardView(Model model){
		  List<WriteBoardViewVo> writeBoardList = myPageService.getWriteBoardList();
		  model.addAttribute("writeBoardList", writeBoardList);
		  
		return "/mypage/writeboardview";
	}
	

}
