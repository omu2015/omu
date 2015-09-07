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
		ThemeVo themeVo=new ThemeVo();
		themeVo.setTheme_no(1);
		themeVo.setThemeName("노래방");
		
		themeDao.insert(themeVo);
		List<ThemeVo> list=themeDao.selectAll();
		System.out.println(list.get(0).getTheme_no()+list.get(0).getThemeName());
		
		//System.out.println(list.toString());
		
	}
}
