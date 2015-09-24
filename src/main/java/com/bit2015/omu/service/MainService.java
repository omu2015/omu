package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class MainService {
  
	@Autowired
	MainDao mainDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	CommentsDao commentsDao;
	@Autowired
	ThemeBoxDao themeBoxDao;
	@Autowired
	GoodDao goodDao;
	@Autowired
	PlanDao planDao;
/*---------------------------------*/	
	@Autowired
	MemberDao memberDao;
	
	
	public void interest(Long member_no, Long[] theme_no){
		List<ThemeBoxVo> list = themeBoxDao.selectAllByMm(member_no);
		ThemeBoxVo themeBoxVo = new ThemeBoxVo();
		if(list == null) {
			for(int i=0; i<theme_no.length; i++){
				themeBoxVo.setMember_no(member_no);
				themeBoxVo.setTheme_no(theme_no[i]);
				themeBoxDao.insert(themeBoxVo);
				}
		}
			else{
				themeBoxDao.deleteMember(member_no);
				for(int i=0; i<theme_no.length; i++){
				themeBoxVo.setMember_no(member_no);
				themeBoxVo.setTheme_no(theme_no[i]);
				themeBoxDao.insert(themeBoxVo);
				}
			
		}
	}
	
	public void  insert (CommentsVo commentsVo){
		commentsDao.insert(commentsVo);
	}
	public void insert (HttpSession session, @ModelAttribute ContentVo contentVo, long theme_no,String themeName ){
		mainDao.insert(contentVo);
	}
	
	public void test123(HttpSession session, String id, String themeName, ContentVo contentVo){
		ContentVo cntVo = contentDao.selectVoById(id);
		ThemeVo themeVo = themeDao.getNo(themeName);
		if(cntVo==null){
			if(themeVo==null){
				ThemeVo tmVo = new ThemeVo();		//tmVo 선언
				tmVo.setThemeName(themeName);		//tmVo에 themeName값을 넣음
				themeDao.insert(tmVo);		//themeDao의 insert실행(tmVo값)
				ThemeVo tmVo1 = themeDao.getNo(themeName);	//(themeName값)
				Long theme_no = tmVo1.getTheme_no();
				contentVo.setTheme_no(theme_no);		//contentVo의 Theme_no에 theme_no값을 넣음
				contentDao.insert(contentVo);		//contentDao에 insert실행(contentVo값)
			}else{
				MemberVo vo = (MemberVo) session.getAttribute("authUser"); //로그인한 유저의 member_no값을 가져옴
				Long theme_no = themeVo.getTheme_no();		//themeVo의 Theme_no값을 theme_no에 넣음
				contentVo.setTheme_no(theme_no);		//contentVo의 Theme_no에 theme_no값을 넣음
				contentDao.insert(contentVo);		//contentDao에 insert실행(contentVo값)
			}
		}
	}
	public Object[] selectContentByTheme(Long member_no){
		List<ThemeBoxVo> list = themeBoxDao.selectAllByMm(member_no);
		Object[] getContent = new Object[list.size()];
		List<ContentVo> contentList = new ArrayList<ContentVo>();
		ThemeBoxVo themeBoxVo =new ThemeBoxVo();
		for(int i=0; i<list.size(); i++){
			themeBoxVo = list.get(i);
			contentList = contentDao.selectContentByTheme(themeBoxVo.getTheme_no());
			getContent [i] = contentList;
			}
		return getContent;
	}
	public List<ThemeBoxVo> getThemeBox(Long member_no){
		List<ThemeBoxVo> list = themeBoxDao.selectAllByMm(member_no);
		return list;
	}
	public List<ContentVo> selectAllContent(){
		List<ContentVo> list = contentDao.selectAll();
		return list;
	}
	public ContentVo getContent(Long content_no){
		ContentVo contentVo = contentDao.selectVo(content_no);
		return contentVo;
	}
	public void insertGood(Long content_no, Long member_no){
		GoodVo goodVo = new GoodVo();
		goodVo.setContent_no(content_no);
		goodVo.setMember_no(member_no);
		goodDao.insert(goodVo);
	}
	public GoodVo selectMno(Long member_no, Long content_no){
		GoodVo goodVo = goodDao.selectVoCnoMno(content_no, member_no);
		return goodVo;
	}
	public List<GoodVo> selectCntNo(Long content_no){
		List<GoodVo> list = goodDao.selectAllByCno(content_no);
		return list;
	}
	
	public PlanVo getUserPlan(Long member_no){
		PlanVo planVo = mainDao.getUserPlan(member_no);
		return planVo;
	}
	
	public void insertPlan(PlanVo planVo){
		planDao.insert(planVo);
	}
	
	
	
/*	public MemberVo selectVo(Long member_no){
		MemberVo memberVo = memberDao.selectVo(member_no);
		return memberVo;
	}*/

}
