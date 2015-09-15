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



@Controller
@RequestMapping("/planner")
public class PlannerController {
		
		@Autowired
		PlannerService plannerService;
		
		@RequestMapping("")
		public String test(Model model, HttpSession session){
			/*List<JusoVo> list = plannerService.getSi();
			model.addAttribute("jusoList", list);
			List<JusoVo> list1 = plannerService.getFirstGun();
			model.addAttribute("gunList", list1);*/
			
			MemberVo vo = (MemberVo)session.getAttribute("authUser");
			List<PlanVo> list = plannerService.showPlan(vo.getMember_no());
			model.addAttribute("planList", list);
			
			return "/planner/plan";
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
		public void addCart(@ModelAttribute ContentVo contentVo, HttpSession session){
			MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
			long member_no = memberVo.getMember_no();
			String themeName = contentVo.getCategory();
			String id = contentVo.getId();
			plannerService.addCart(contentVo, themeName, id, member_no);
		}	
		@RequestMapping("/addPlan")
		public String addPlan(@RequestParam String planDate, HttpSession session,  Model model){
		PlanVo planVo = new PlanVo();
		MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
		
		planVo.setPlanDate(planDate);
		planVo.setMember_no(memberVo.getMember_no());
		
		model.addAttribute("planList", planVo);
		plannerService.addPlan(planVo);
		return "redirect:/planner";
		}
		@RequestMapping("/showPlan")
		@ResponseBody
		public List<PlanVo> showPlan(HttpSession session){
			MemberVo memberVo =(MemberVo)session.getAttribute("authUser");
			List<PlanVo> list = plannerService.showPlan(memberVo.getMember_no());
			
			return list;
			
		}
}
