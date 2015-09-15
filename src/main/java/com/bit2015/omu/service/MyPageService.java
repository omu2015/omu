package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.util.FileUploader;
import com.bit2015.omu.vo.CalendarVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodViewVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class MyPageService {
	@Autowired
	MemberDao memberDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	GoodDao goodDao;
	
	
	
	FileUploader ful=new FileUploader();

	/* 회원수정 */
	public void memberModify(HttpSession session,
			@ModelAttribute MemberVo memberVo, String repassword,
			String password1 ,MultipartFile img) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword().equals(password1));
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberName(memberVo.getMemberName());
			vo.setAddress(memberVo.getAddress());
			vo.setPassword(repassword);
			String member_img_url=ful.upload(img);
			vo.setImageUrl(member_img_url);
			vo.setPhoneNum1(memberVo.getPhoneNum1());
			vo.setPhoneNum2(memberVo.getPhoneNum2());
			vo.setPhoneNum3(memberVo.getPhoneNum3());
			vo.setEmail(memberVo.getEmail());
			vo.setZipcode(memberVo.getZipcode());
			memberDao.update(vo);
			System.out.println(vo);
		}
	}
    // 회원탈퇴
	public void memberLeave(HttpSession session,
			@ModelAttribute MemberVo memberVo, String password1) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword());
		System.out.println(password1);
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword().equals(password1));
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberStatus(memberVo.getMemberStatus());
			memberDao.update(vo);
			System.out.println(vo);
		} else {
			System.out.println("비번이 서로 달라");

		}
	}
    //먹놀자 달력
	public List<CalendarVo> selectView(){
		List<CalendarVo> viewList = new ArrayList<CalendarVo>();
		List<ContentBoxVo> contentBoxList = contentBoxDao.selectAll();
		List<ContentVo> contentList = contentDao.selectAll();
		
		
		for(int i = 0; i<contentBoxList.size();i++){
			CalendarVo calendarVo = new CalendarVo();
			long content_no = contentBoxList.get(i).getContent_no();
			long contentBox_no = contentBoxList.get(i).getContentBox_no();
			long plan_no = contentBoxList.get(i).getPlan_no();  
			long member_no = planDao.selectVo(plan_no).getMember_no();
		 
			calendarVo.setContent_no(content_no);
			calendarVo.setRegDate(contentDao.selectVo(content_no).getRegDate());
			calendarVo.setMember_no(member_no);
			calendarVo.setAddress(contentDao.selectVo(content_no).getAddress());
			calendarVo.setPhone(contentDao.selectVo(content_no).getPhone());
			calendarVo.setNewAddress(contentDao.selectVo(content_no).getNewAddress());
			calendarVo.setImageUrl(contentDao.selectVo(content_no).getImageUrl());
			calendarVo.setDirection(contentDao.selectVo(content_no).getDirection());
			calendarVo.setZipcode(contentDao.selectVo(content_no).getZipcode());
			calendarVo.setPlaceUrl(contentDao.selectVo(content_no).getPlaceUrl());
			calendarVo.setId(contentDao.selectVo(content_no).getId());
			calendarVo.setTitle(contentDao.selectVo(content_no).getTitle());
			calendarVo.setCategory(contentDao.selectVo(content_no).getCategory());
			calendarVo.setAddress(contentDao.selectVo(content_no).getAddress());
			calendarVo.setLongitude(contentDao.selectVo(content_no).getLongitude());
			calendarVo.setLatitude(contentDao.selectVo(content_no).getLatitude());
			calendarVo.setAddressBCode(contentDao.selectVo(content_no).getAddressBCode());
			calendarVo.setCost(contentDao.selectVo(content_no).getCost());
			calendarVo.setTime(contentDao.selectVo(content_no).getTime());
		    calendarVo.setPlanDate(planDao.selectVo(plan_no).getPlanDate());
		    calendarVo.setTotalCost(planDao.selectVo(plan_no).getTotalCost());
		    calendarVo.setTotalTime(planDao.selectVo(plan_no).getTotalTime());
		    
		    viewList.add(i, calendarVo);
			
		}
		return viewList;
	}
	// good 조아요 표시
	public List<GoodViewVo> selectGood(){
		List<GoodViewVo> goodViewList = new ArrayList<GoodViewVo>();
		List<GoodVo> goodList =  goodDao.selectAll();
		List<ContentVo> contentList = contentDao.selectAll();
		List<MemberVo>  memberList = memberDao.selectAll();
		for(int i = 0; i<goodList.size();i++){
		GoodViewVo goodViewVo = new GoodViewVo();
			long good_no= goodList.get(i).getGood_no();
			long content_no = contentList.get(i).getContent_no();
			long member_no = memberList.get(i).getMember_no();
		 
			goodViewVo.setContent_no(content_no);
			goodViewVo.setRegDate(contentDao.selectVo(content_no).getRegDate());
			goodViewVo.setMember_no(member_no);
			goodViewVo.setPhone(contentDao.selectVo(content_no).getPhone());
			goodViewVo.setNewAddress(contentDao.selectVo(content_no).getNewAddress());
			goodViewVo.setImageUrl(contentDao.selectVo(content_no).getImageUrl());
			goodViewVo.setDirection(contentDao.selectVo(content_no).getDirection());
			goodViewVo.setZipcode(contentDao.selectVo(content_no).getZipcode());
			goodViewVo.setPlaceUrl(contentDao.selectVo(content_no).getPlaceUrl());
			goodViewVo.setId(contentDao.selectVo(content_no).getId());
			goodViewVo.setTitle(contentDao.selectVo(content_no).getTitle());
			goodViewVo.setCategory(contentDao.selectVo(content_no).getCategory());
			goodViewVo.setAddress(contentDao.selectVo(content_no).getAddress());
			goodViewVo.setLongitude(contentDao.selectVo(content_no).getLongitude());
			goodViewVo.setLatitude(contentDao.selectVo(content_no).getLatitude());
			goodViewVo.setAddressBCode(contentDao.selectVo(content_no).getAddressBCode());
			goodViewVo.setCost(contentDao.selectVo(content_no).getCost());
			goodViewVo.setTime(contentDao.selectVo(content_no).getTime());
			goodViewVo.setGood_no(good_no);
			goodViewList.add(i,goodViewVo);
		}
		return goodViewList;
	}
	
}
