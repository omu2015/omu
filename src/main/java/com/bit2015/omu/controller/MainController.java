package com.bit2015.omu.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.service.MainService;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Controller
@RequestMapping()
public class MainController {

	@Autowired
	private MainDao mainDao; 
	@Autowired
	private ContentDao contentDao; 
	@Autowired
	private CommentsDao commentsDao; 
   @Autowired
    MainService mainService;
	
	
	@RequestMapping()
	public String index(Model model, HttpSession session){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		if(memberVo ==null){
			List<ContentVo> list = mainDao.getList();
			model.addAttribute("contentList", list);
			List<CommentsVo> list2 = mainDao.getList2();
			model.addAttribute("list2", list2);
			List<ThemeVo> list3 = mainDao.getList3();
			model.addAttribute("list3", list3);
		}else{
			Long member_no = memberVo.getMember_no();
			Object[] getContent =mainService.selectContentByTheme(member_no);
			for(int i = 0; i<getContent.length; i++){
				 model.addAttribute("contentList"+i, getContent[i]);
			}
		}
		return "/main/index";
	}	

	@RequestMapping("/contentView")
	public String contentView(Model model, HttpSession session ,  @RequestParam Long content_no){
		List<CommentsVo> list2 = mainDao.getList2();
		model.addAttribute("list2", list2);
		ContentVo contentVo = mainService.getContent(content_no);
		model.addAttribute("contentVo", contentVo);
		return "/main/contentview";
	}
	
  @RequestMapping("/commentwrite")
	public String insert(@ModelAttribute CommentsVo commentsVo){
	  mainService.insert(commentsVo);
		return "redirect:/";	
	}
  
  @RequestMapping("/commentdelete")
  	public String delete(long comments_no){
	  System.out.println(comments_no);
	  commentsDao.delete(comments_no);
	  return "redirect:/";
  }
  @RequestMapping("/getContent")
  @ResponseBody
  public Object getContent(@RequestParam Long content_no){
	  ContentVo contentVo = mainService.getContent(content_no);
	  return contentVo;	  
  }
 
/*  @RequestMapping("/interest")
	public String update(HttpSession session ,@ModelAttribute CommentsVo commentsVo){
	        mainService.insert(session,commentsVo);
		return "redirect:/";	
	} */
/*	@RequestMapping("/test123")
	@ResponseBody
	public ContentVo test123(@ModelAttribute ContentVo contentVo, HttpSession session, Model model){
		String id = contentVo.getId();
		String themeName = contentVo.getCategory();
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		mainService.test123(id, themeName,contentVo);
		return contentVo;
	}*/
}
