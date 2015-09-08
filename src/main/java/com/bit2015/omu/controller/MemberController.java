package com.bit2015.omu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.omu.service.MemberService;
import com.bit2015.omu.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/joinForm")
	public String joinForm(){
		return "/member/join_form";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute MemberVo memberVo,
						@RequestParam String year,
						@RequestParam String month,
						@RequestParam String day
						
			){
		memberVo.setBirth(year+month+day);
		memberVo.setMemberGrade("member");			// 회원가입시 회원등급 자동 member
		memberVo.setMemberStatus("active");			// 회원가입시 회원활동 자동 active
		System.out.println(memberVo);
		memberService.join(memberVo);
		return "redirect:/";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, @ModelAttribute MemberVo memberVo){
		MemberVo vo = memberService.login(memberVo);
		if(vo == null){	//로긴실패
			return "redirect:/member";
		}
		//로긴처리
		session.setAttribute("authUser", vo);
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, @ModelAttribute MemberVo memberVo){
		session.removeAttribute( "authUser" );
		session.invalidate();
		return "redirect:/";
	}
}
