package com.bit2015.omu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.MemberService;

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
	public String join(ModelAttribute memberVo){
		memberService.join(memberVo);
		return "redirect:/";
		
	}

}
