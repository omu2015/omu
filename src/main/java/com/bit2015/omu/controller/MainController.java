package com.bit2015.omu.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.service.MainService;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.ThemeVo;

@Controller
@RequestMapping()
public class MainController {

	@Autowired
	private MainDao mainDao; 
	@Autowired
	private ContentDao contentDao; 
   @Autowired
    MainService mainService;
	
	
	@RequestMapping()
	public String index(Model model){
		List<ContentVo> list = mainDao.getList();
		model.addAttribute("list", list);
		List<CommentsVo> list2 = mainDao.getList2();
		model.addAttribute("list2", list2);
		List<ThemeVo> list3 = mainDao.getList3();
		model.addAttribute("list3", list3);
		return "/main/index";
	}	

	@RequestMapping("/contentview/{no}")
	public String contentView(Model model,HttpSession session , ContentVo contentVo){
		List<ContentVo> list = mainDao.getList();
		model.addAttribute("list", list);
		return "/main/contentview";
	}
	
/*  @RequestMapping("/commentwrite")
	public String insert(@ModelAttribute ContentVo contentVo, HttpSession session, @ModelAttribute CommentsVo commentsVo){
	  MemberVo memberVo =(MemberVo)session.getAttribute("authUser");  
	  long member_no = memberVo.getMember_no();
	  String themeName = contentVo.getCategory();
	  String id = contentVo.getId();
	  mainService.insert(session,commentsVo, themeName, id, member_no);
		return "redirect:/";	
	}*/
 
/*  @RequestMapping("/interest")
	public String update(HttpSession session ,@ModelAttribute CommentsVo commentsVo){
	        mainService.insert(session,commentsVo);
		return "redirect:/";	
	} */
}
