package com.bit2015.omu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.service.AdminService;
import com.bit2015.omu.service.DaoTestService;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;
import com.bit2015.omu.vo.ViewVo;

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
		List<PlanVo> planList=adminService.selectPlan();
		model.addAttribute("planList", planList);
		List<ContentBoxVo> contentBoxList=adminService.selectContentBox();
		model.addAttribute("contentBoxList", contentBoxList);
		List<ViewVo> viewList=adminService.selectView();
		model.addAttribute("viewList", viewList);
		List<ThemeBoxVo> themeBoxList=adminService.selectThemeBox();
		model.addAttribute("themeBoxList", themeBoxList);
		List<BoardVo> boardList = adminService.selectBoard();
		model.addAttribute("boardList", boardList);
		List<GoodVo> goodList = adminService.selectGood();
		model.addAttribute("goodList", goodList);
		
		return "/admin/index";
	}	
	
	@RequestMapping("/insertmember")
	public String insertMember(MemberVo memberVo, @RequestParam(required=false)MultipartFile img ){
		if(img==null)System.out.println("!!!!!!!!");
		System.out.println(memberVo.toString());
		adminService.insertMember(memberVo, img);
		
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletemember")
	public String deleteMember(@RequestParam Long member_no){
		adminService.deleteMember(member_no);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/insertcontent")
	public String insertContent(ContentVo contentVo, HttpSession session){
		
		System.out.println(contentVo.toString());
		adminService.insertContent(contentVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("//deletecontent")
	public String deleteContent(@RequestParam Long content_no){
		adminService.deleteContent(content_no);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/inserttheme")
	public String insertTheme(ThemeVo themeVo){
		
		System.out.println(themeVo.toString());
		adminService.insertTheme(themeVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletetheme")
	public String deleteTheme(@RequestParam Long theme_no){
		adminService.deleteTheme(theme_no);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/insertplan")
	public String insertPlan(PlanVo planVo){
		
		System.out.println(planVo.toString());
		adminService.insertPlan(planVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deleteplan")
	public String deletePlan(@RequestParam Long plan_no){
		adminService.deletePlan(plan_no);
		return "redirect:/admin";
	}	
	
	
	
	@RequestMapping("/insertcontentbox")
	public String insertContentBox(ContentBoxVo contentBoxVo){
		System.out.println(contentBoxVo.toString());
		adminService.insertContentBox(contentBoxVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletecontentbox")
	public String deleteContentBox(@RequestParam Long contentBox_no){
		adminService.deleteContentBox(contentBox_no);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/insertthemebox")
	public String insertThemeBox(ThemeBoxVo themeBoxVo){
		System.out.println(themeBoxVo.toString());
		adminService.insertThemeBox(themeBoxVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletethemebox")
	public String deleteThemeBox(@RequestParam Long themeBox_no){
		adminService.deleteThemeBox(themeBox_no);
		return "redirect:/admin";
	}	
	
	
	@RequestMapping("/insertboard")
	public String insertBoard(BoardVo boardVo){
		System.out.println(boardVo.toString());
		adminService.insertBoard(boardVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deleteboard")
	public String deleteBoard(@RequestParam Long board_no){
		adminService.deleteBoard(board_no);
		return "redirect:/admin";
	}	
	
	
	@RequestMapping("/insertgood")
	public String insertGood(GoodVo goodVo){
		System.out.println(goodVo.toString());
		adminService.insertGood(goodVo);
		return "redirect:/admin";
	}	
	
	@RequestMapping("/deletegood")
	public String deleteGood(@RequestParam Long good_no){
		adminService.deleteGood(good_no);
		return "redirect:/admin";
	}	
	
	
	
	
	
	
	
	
	// 주우성이 테스트용으로 좀 쓰겠습니다.
	@RequestMapping("/test")
	public String test() {
		
		return "/admin/index2";
	}
	
	
}
