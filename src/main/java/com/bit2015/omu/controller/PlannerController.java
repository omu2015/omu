package com.bit2015.omu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.PlannerService;
import com.bit2015.omu.vo.JusoVo;



@Controller
@RequestMapping("/planner")
public class PlannerController {
		
		@Autowired
		PlannerService plannerService;
		
		@RequestMapping("")
		public String test(Model model){
			List<JusoVo> list = plannerService.getSi();
			model.addAttribute("jusoList", list);
			
			return "/planner/index";
		}	
	
		
		
}
