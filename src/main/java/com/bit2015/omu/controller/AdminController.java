package com.bit2015.omu.controller;

import java.util.List;

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
	@Autowired
	DaoTestService daoTestService;
	
	
	@RequestMapping()
	public String index(Model model){
		List<MemberVo>list=adminService.selectMember();
		model.addAttribute("list",list);
		
		return "/admin/index";
	}	
	
	@RequestMapping("/insertmember")
	public String addMember(MemberVo memberVo){
		System.out.println(memberVo.toString());
		adminService.insertMember(memberVo);
		
		return "/admin";
	}	
	
	
	// 주우성이 테스트용으로 좀 쓰겠습니다.
	@RequestMapping("/test")
	public void test() {
		daoTestService.test();
	}
	
	
}
