package com.bit2015.omu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.AdminService;
import com.bit2015.omu.service.DaoTestService;
import com.bit2015.omu.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping()
	public String index(){
		return "/admin/index";
	}	
	
	@RequestMapping("/addmember")
	public String addMember(MemberVo memberVo){
		System.out.println(memberVo.toString());
		adminService.addMember(memberVo);
		
		return "/admin/index";
	}	
	
	
	// 주우성이 테스트용으로 좀 쓰겠습니다.
	@RequestMapping("/test")
	public String test() {
		return "redirect:#";
	}
	
	
}
