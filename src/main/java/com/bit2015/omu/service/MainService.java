package com.bit2015.omu.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.MemberVo;
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
	
/*	public void  insert (ContentVo contentVo, HttpSession session,@ModelAttribute CommentsVo commentsVo,String themeName,String id, Long member_no){
		ThemeVo themeVo = themeDao.getNo(themeName);
		ContentVo testContentVo = contentDao.selectVoById(id);
		if(testContentVo ==null){
			if(themeVo == null){
			themeVo = new ThemeVo();
			themeVo.setThemeName(themeName);
			themeDao.insert(themeVo);
			ThemeVo testThemeVo = themeDao.getNo(themeName);
			contentVo.setTheme_no(testThemeVo.getTheme_no());
			contentVo.setMember_no(member_no);  
			contentDao.insert(contentVo);
		
			ContentVo cntVo = contentDao.selectVoById(id);
			CommentsVo commentsVo = new CommentsVo();
			commentsVo.setContent_no(content_no);
			
			commentsDao.insert(commentsVo);
	}
		}
	}*/
	public void insert (HttpSession session, @ModelAttribute ContentVo contentVo, long theme_no,String themeName ){
		
		mainDao.insert(contentVo);
		
	}
}
