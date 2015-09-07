package com.bit2015.omu.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class TestService {
	
	@Autowired
	MemberDao memberDao;
	
	public void test(){
		
		
		//////////member.xml
		
		//List<MemberVo> list=memberDao.selectAll();
		//System.out.println(list.toString());

		//insert
		/*
		MemberVo memberVo=new MemberVo();
		memberVo.setMemberId("woosungchu");
		memberVo.setMemberName("주우성");
		memberVo.setPassword("1234");
		memberVo.setImageURL("abcd");
		memberVo.setMemberGrade("guest");
		memberVo.setMemberStatus("alive");
		memberVo.setBirth("1992.10.10");
		memberVo.setAddress("캉남큐");
		memberVo.setPhoneNum1("010");
		memberVo.setPhoneNum2("1234");
		memberVo.setPhoneNum2("5678");
		memberVo.setJoinDate("20150907");
		memberVo.setJoinOutDate("hewillnot");
		memberVo.setEmail("woosungchu@asad.com");
		memberVo.setZipCode("137-140");
		memberDao.insert(memberVo);
		System.out.println(memberVo.toString());
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		*/
		
		//delete
		//memberDao.delete((long)8);
		//List<MemberVo> list=memberDao.selectAll();
		//System.out.println(list.toString());
		
		//selectVo
		//MemberVo memberVo=memberDao.selectVo((long) 7);
		//System.out.println(memberVo.toString());
	
		//update
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		MemberVo memberVo=memberDao.selectVo((long) 11);
		memberVo.setMemberName("주우섯");
		memberDao.update(memberVo);
		List<MemberVo> list2=memberDao.selectAll();
		System.out.println(list2.toString());
		
		
		//////////theme.xml

		//insert
		//ThemeVo themeVo=new ThemeVo();
		//themeVo.setTheme_no(1);
		//themeVo.setThemeName("박진용");
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
