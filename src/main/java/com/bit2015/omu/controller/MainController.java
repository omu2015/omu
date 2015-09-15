package com.bit2015.omu.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.service.MainService;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;

@Controller
@RequestMapping()
public class MainController {

	@Autowired
	private MainDao mainDao; 
   @Autowired
    MainService mainService;
	
	
	@RequestMapping()
	public String index(Model model){
		List<ContentVo> list = mainDao.getList();
		model.addAttribute("list", list);
		List<CommentsVo> list2 = mainDao.getList2();
		model.addAttribute("list2", list2);		
		return "/main/index";
	}	

  @RequestMapping("/commentwrite")
	public String insert(HttpSession session ,@ModelAttribute CommentsVo commentsVo){
	        mainService.insert(session,commentsVo);
		return "redirect:/";	
	}
  
}
