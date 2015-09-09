package com.bit2015.omu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@RequestMapping("")
 public String  memberModifyForm(){
	 
	 return "/mypage/membermodifyform";
 }
}
