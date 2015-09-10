package com.bit2015.omu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.MyPageService;
import com.bit2015.omu.vo.MemberVo;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	 MyPageService myPageService;
	
	@RequestMapping("")
	public String myPage(){
		return "/mypage/mypageindex";
    }
	
	@RequestMapping("/membermodifyform")
    public String  memberModifyForm(HttpSession session , @ModelAttribute MemberVo memberVo){
	 MemberVo vo = (MemberVo) session.getAttribute("authUser");
	 return "/mypage/membermodifyform";
  }
	@RequestMapping("/membermodifyformok")
	public String modify(HttpSession session,@ModelAttribute MemberVo memberVo ,String repassword,String password1){
	     myPageService.memberModify(session, memberVo,repassword,password1);
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
}
