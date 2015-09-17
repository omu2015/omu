package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.ContentVo;
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
	public void test123(String id, String themeName, ContentVo contentVo){
		ContentVo cntVo = contentDao.selectVoById(id);
		ThemeVo themeVo = themeDao.getNo(themeName);
		if(cntVo==null){
			if(themeVo==null){
				ThemeVo tmVo = new ThemeVo();
				tmVo.setThemeName(themeName);
				themeDao.insert(tmVo);
				ThemeVo tmVo1 = themeDao.getNo(themeName);
				Long theme_no = tmVo1.getTheme_no();
				contentVo.setTheme_no(theme_no);
				contentDao.insert(contentVo);
			}else{
				Long theme_no = themeVo.getTheme_no();
				contentVo.setTheme_no(theme_no);
				
				
				
				
				contentDao.insert(contentVo);
			}
		}
	}
	public List<ContentVo> selectContentByTheme(Long member_no){
		List<ThemeBoxVo> list = themeBoxDao.selectAllByMm(member_no);
		List<ContentVo> contentList = new ArrayList<ContentVo>();
		ThemeBoxVo themeBoxVo =new ThemeBoxVo();
		for(int i=0; i<list.size(); i++){
			themeBoxVo = list.get(i);
			contentList =contentDao.selectContentByTheme(themeBoxVo.getTheme_no());
			}
		return contentList;
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
	
}
