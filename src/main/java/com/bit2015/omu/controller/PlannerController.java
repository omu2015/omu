package com.bit2015.omu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/planner")
public class PlannerController {
	
	
		@RequestMapping("")
		public String test(){
			return "/planner/index";
		}	
	
		
		
}
