package com.bit2015.omu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test2")
	public String test(){
		return "/test/maptest2";
	}
	@RequestMapping("/test1")
	public String test1(){
		return "/test/maptest";
	}
}
