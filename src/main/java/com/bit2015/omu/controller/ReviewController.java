package com.bit2015.omu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.service.DaoTestService;
import com.bit2015.omu.service.ReviewService;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
   
   @Autowired
   ReviewService reviewService;
   
   @RequestMapping()
   public String index(Model model, HttpSession session){
	   reviewService.index(model);
	   
      if(session!=null){
    	  System.out.println("session!=null");
         reviewService.pickTheme(model, session);
      }
      
      return "/review/index";
   }
   
   @RequestMapping("/callPlanList")
   @ResponseBody
   public Map<String, Object> callPlanList(@RequestParam String id){
      List<PlanVo> planList =reviewService.getPlanListById(id);
      
      //ajax-jason
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("planList", planList);
      
      return map;
   }
   
   @RequestMapping("/showboard")
   public String showBoard(Model model, @RequestParam String plan_no){
      reviewService.showboard(model, plan_no);
      
      return "/review/showboard";
   }
   
   @RequestMapping("/test")
   public String test(){
      
      return "/review/mapp";
   }
   
    
}