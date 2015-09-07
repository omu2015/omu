package com.bit2015.omu.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class TestService {
	
	@Autowired
	ThemeDao themeDao;
	
	public void test(){
		//List<BoardVo> list=boardDao.selectAll();
		//List<BoardVo> list=ImgDao.selectAll();

		//insert
		//ThemeVo themeVo=new ThemeVo();
		//themeVo.setTheme_no(2);
		//themeVo.setThemeName("피시방");
		//themeDao.insert(themeVo);
		
		//delete
		//themeDao.delete((long)1);
		//List<ThemeVo> list=themeDao.selectAll();
		//System.out.println(list.toString());
		
		//selectVo
		//ThemeVo themeVo=themeDao.selectVo((long) 2);
		//System.out.println(themeVo.getTheme_no()+themeVo.getThemeName());
		
		//update
		//List<ThemeVo> list=themeDao.selectAll();
		//System.out.println(list.toString());
		//	ThemeVo themeVo=themeDao.selectVo((long)2);
		//themeVo.setThemeName("주우성수정완료");
		//	themeDao.update(themeVo);
		//List<ThemeVo> list2=themeDao.selectAll();
		//System.out.println(list2.toString());

		
		//System.out.println(list.toString());
		
	}
}
