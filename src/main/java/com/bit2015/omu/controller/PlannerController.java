package com.bit2015.omu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.PJYTestService2;

@Controller
@RequestMapping("/pjy")
public class PlannerController {
	
	

		@Autowired
		PJYTestService2 testService2;


		@RequestMapping("/testAll")
		public void test(){
			testService2.test();
		}	
	
		
		
}
