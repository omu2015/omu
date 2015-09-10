package com.bit2015.omu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.vo.ContentVo;

@Controller
@RequestMapping()
public class MainController {

	@Autowired
	private MainDao mainDao; 
	ContentVo contentVo;
	
	
	@RequestMapping()
	public String index(Model model){
		List<ContentVo> list = mainDao.getList();
		model.addAttribute("list", list);
		
		return "/main/index";
	}	

}
