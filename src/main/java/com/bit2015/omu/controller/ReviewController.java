package com.bit2015.omu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.service.ReviewService;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.PlanVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
   
   @Autowired
   ReviewService reviewService;
   
   @RequestMapping()
   public String index(Model model, HttpSession session){
	   reviewService.index(model);
	   
      if(session.getAttribute("authUser")!=null){
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
   public String showBoard(Model model, @RequestParam Long plan_no){
      reviewService.showboard(model, plan_no);
      System.out.println(model.toString());
      return "/review/showboard";
   }
   
   @RequestMapping("/createboard")
   public String createBoard(Model model, HttpSession session, @RequestParam(defaultValue="-1") Long plan_no){
      if(session.getAttribute("authUser")!=null){
    	  reviewService.createBoard(model,session,plan_no);
      }
      return "/review/createboard";
   }
   
   @RequestMapping("/insertboard")
   public String insertBoard(Model model, BoardVo boardVo, HttpSession session, @RequestParam(defaultValue="0") Long totalCost, @RequestParam(defaultValue="0") Long totalTime, @RequestParam(required=false)MultipartFile img ){
	   System.out.println("insertboadr ctrl ===  "  + boardVo.toString());
	   System.out.println("totalCost ==  " + totalCost);
	   System.out.println("totalTime ==" + totalTime);
	   
	   reviewService.insertBoard(model, boardVo, session, totalCost, totalTime, img);
	   
	   
      return "/review/index";
   }
/*   
   @RequestMapping(value = "/getMyCL", produces="text/plain;charset=UTF-8")
   @ResponseBody
   public String getMyCL(@RequestParam String plan_no){
	  
	   String jsonCL =reviewService.getMyCL(plan_no);
	   System.out.println("getMyCl - jsonCl =========" + jsonCL);
	   
      return jsonCL;
   }
   
   */
   
   
   
   @RequestMapping("/test")
   public String test(Model model){
	   
	   reviewService.test(model);
      
      return "/review/mapp";
   }
   
    
}