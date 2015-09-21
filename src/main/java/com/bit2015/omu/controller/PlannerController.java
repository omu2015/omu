package com.bit2015.omu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.omu.service.PlannerService;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.JusoVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
@RequestMapping("/planner")
public class PlannerController {
		
		@Autowired
		PlannerService plannerService;
		
		@RequestMapping("")
		public String index(Model model, HttpSession session){
			MemberVo vo = (MemberVo)session.getAttribute("authUser");
			if(vo == null){
				return "/planner/plan";	
			}
			List<PlanVo> list = plannerService.showPlan(vo.getMember_no());
			
			ObjectMapper objectMapper = new ObjectMapper();      
			String jsonCL = "";      
			try {
		    jsonCL =objectMapper.writeValueAsString(list);
		         
		     } catch (JsonProcessingException e) {  
		    	 e.printStackTrace();    
		    }
			model.addAttribute("planList", jsonCL);
			
			return "/planner/plan";
		}
		@RequestMapping("/map")
		public String map(Model model, HttpSession session) {
			MemberVo vo = (MemberVo)session.getAttribute("authUser");
			PlanVo planVo = plannerService.getPlanNo(vo.getMember_no());
			model.addAttribute("planVo", planVo);
			
			List<JusoVo> list = plannerService.getSi();
			model.addAttribute("jusoList", list);
			List<JusoVo> list1 = plannerService.getFirstGun();
			model.addAttribute("gunList", list1);
			return "/planner/index";
		}
		@RequestMapping("/getGun")
		@ResponseBody
		public List<JusoVo> getGun(Model model, @RequestParam String localValue){
			List<JusoVo> list = plannerService.getGun(localValue);
			
			return list;
		}
		@RequestMapping("/getDong")
		@ResponseBody
		public List<JusoVo> getDong(Model model, @RequestParam String localValue, @RequestParam(required=false , defaultValue="서웉특별시") String si){
			List<JusoVo> list = plannerService.getDong(si,localValue);
			
			return list;
		}	
		@RequestMapping("/addCart")
		@ResponseBody
		public void addCart(@ModelAttribute ContentVo contentVo, HttpSession session, @RequestParam Long plan_no){
			System.out.println(contentVo);
			MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
			long member_no = memberVo.getMember_no();
			String themeName = contentVo.getCategory();
			String id = contentVo.getId();
			String imageUrl = contentVo.getImageUrl();
			if(imageUrl.equals("")){
				imageUrl = "/assets/img/noimage.jpg";
				contentVo.setImageUrl(imageUrl);
			}
			System.out.println(contentVo);
			plannerService.addCart(contentVo, themeName, id, member_no, plan_no);
			
		}	
		@RequestMapping("/addPlan")
		public String addPlan(@RequestParam String planDate, HttpSession session,  Model model){
		PlanVo planVo = new PlanVo();
		MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
		
		planVo.setPlanDate(planDate);
		planVo.setMember_no(memberVo.getMember_no());
		
		model.addAttribute("planList", planVo);
		plannerService.addPlan(planVo);
		
		return "redirect:/planner/map";
		}
		
		@RequestMapping("/showPlan")
		@ResponseBody
		public List<PlanVo> showPlan(HttpSession session){
			MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
			List<PlanVo> list = plannerService.showPlan(memberVo.getMember_no());
			
			return list;
			
		}
		
		@RequestMapping("/viewPlan")
		public String viewPlan(@RequestParam Long plan_no, Model model){
			List<ContentVo> list = plannerService.getContentNo(plan_no);
			PlanVo planVo = plannerService.getPlanDate(plan_no);
			model.addAttribute("contentList", list );
			model.addAttribute("planVo", planVo );
			
			return "/planner/viewPlan";
		}
		@RequestMapping("/deletePlan")
		public String deletePlan(@RequestParam Long plan_no, Model model){
			plannerService.deletePlan(plan_no);
			return "redirect:/planner";
		}
		@RequestMapping("/deleteContentBox")
		public String deleteContentBox(@RequestParam Long plan_no,Long content_no){
			plannerService.deleteContentBox(plan_no, content_no);
			return "redirect:/planner";
		}
}
