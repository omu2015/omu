package com.bit2015.omu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.PJYTestService2;

@Controller
@RequestMapping("/planner")
public class PlannerController {
	
	
		@RequestMapping("")
		public String test(){
			return "/planner/index";
		}	
	
		
		
}
