package com.bit2015.omu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.omu.service.AdminService;
import com.bit2015.omu.service.DaoTestService;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	DaoTestService daoTestService;
	
	
	@RequestMapping()
	public String index(Model model){
		List<MemberVo> memberList=adminService.selectMember();
		model.addAttribute("memberList",memberList);
		List<ContentVo> contentList=adminService.selectContent();
		model.addAttribute("contentList",contentList);
		List<ThemeVo> themeList=adminService.selectTheme();
		model.addAttribute("themeList",themeList);
		
		return "/admin/index";
	}	
	
	@RequestMapping("/insertmember")
	public String insertmember(MemberVo memberVo){
		System.out.println(memberVo.toString());
		adminService.insertMember(memberVo);
		
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletemember")
	public String deletemember(@RequestParam Long member_no){
		adminService.deleteMember(member_no);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/insertcontent")
	public String insertcontent(ContentVo contentVo, HttpSession session){
		
		System.out.println(contentVo.toString());
		adminService.insertContent(contentVo);
		return "redirect:/admin";
	}	
	
	// 주우성이 테스트용으로 좀 쓰겠습니다.
	@RequestMapping("/test")
	public void test() {
		daoTestService.test();
	}
	
	
}
