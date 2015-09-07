package com.bit2015.omu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.service.PJYTestService2;
import com.bit2015.omu.service.TestService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	PJYTestService2 test;

	//주우성이 테스트용으로 좀 쓰겠습니다.
	@RequestMapping("/test")
	public void test(){
		test.test();
	}	
}
