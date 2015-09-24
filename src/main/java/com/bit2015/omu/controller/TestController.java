package com.bit2015.omu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("mobile")
	public String test(){
		return "/mobile/index";
	}
	@RequestMapping("/test2")
	public String test1(){
		return "/test/maptest2";
	}
	@RequestMapping("/test3")
	public String test3(){
		return "/test/test3";
	}
}
