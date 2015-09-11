package com.bit2015.omu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.service.DaoTestService;
import com.bit2015.omu.service.ReviewService;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeBoxVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping
	public String index(Model model, HttpSession session){
		reviewService.index(model, session);
		return "/review/index";
	}
	
	
	
}
