package com.bit2015.omu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.BoardCommentsDao;
import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.BoardImgBoxDao;
import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.ImgBoxDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ProductDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
@RequestMapping("/admin")
public class AdminService {
	
	@Autowired
	BoardCommentsDao boardCommentsDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	BoardImgBoxDao boardImgBoxDao;
	@Autowired
	CommentsDao commnetsDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	GoodDao goodDao;
	@Autowired
	ImgBoxDao imgBoxDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	PlanDao planDao;
    @Autowired
    ProductDao  productDao;
    @Autowired
    ThemeBoxDao themeBoxDao;
    @Autowired
    ThemeDao themeDao;
    
	
	public void insertMember(MemberVo memberVo) {
		memberDao.insert(memberVo);
	}
	
	public List<MemberVo> selectMember() {
		List<MemberVo> memberList=memberDao.selectAll();
		return memberList;
		}
	
	public void deleteMember(Long member_no) {
		memberDao.delete(member_no);
		}
	
	
	
	
	public void insertContent(ContentVo contentVo) {
		contentDao.insert(contentVo);
	}

	public List<ContentVo> selectContent() {
		List<ContentVo> contentList=contentDao.selectAll();
		return contentList;
	}

	public void deleteContent(Long content_no) {
		contentDao.delete(content_no);
	}
	
	
	
	public void insertTheme(ThemeVo themeVo) {
		themeDao.insert(themeVo);
	}
	public List<ThemeVo> selectTheme() {
		List<ThemeVo> list=themeDao.selectAll();
		return list;
	}
	public void deleteTheme(Long theme_no) {
		contentDao.delete(theme_no);
	}
	
	
	public void insertPlan(PlanVo planVo) {
		System.out.println(planVo.getPlanDate());
			planDao.insert(planVo);
		
	}
	public List<PlanVo> selectPlan() {
		List<PlanVo> list=planDao.selectAll();
		return list;
	}
	public void deletePlan(Long plan_no) {
		planDao.delete(plan_no);
	}
	
	
	
	
	public void insertContentBox(ContentBoxVo contentBoxVo) {
		System.out.println(contentBoxVo.toString());
		contentBoxDao.insert(contentBoxVo);
	}
	public List<ContentBoxVo> selectContentBox() {
		List<ContentBoxVo> list=contentBoxDao.selectAll();
		return list;
	}
	public void deleteContentBox(Long contentBox_no) {
		contentBoxDao.delete(contentBox_no);
	}
	
	
	
	
}
				
		

