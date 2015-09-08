package com.bit2015.omu.service;



import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;

@Service
public class TestService {
	
	@Autowired
	BoardDao boardDao;
	
	public void test2(){
		
	}
	
	public void test(){
		
	}
	
	public void board(){
		
		 //insert
			/*
			BoardVo boardVo=new BoardVo();
			boardVo.setPlan_no(6);
			boardVo.setMember_no(11);
			boardVo.setMessage("예제 수정후에바바바");
			boardDao.insert(boardVo);
			List<BoardVo> list2=boardDao.selectAll();
			System.out.println(list2.toString());
			*/

			//delete
			/*
			boardDao.delete((long)2);
			List<BoardVo> list=boardDao.selectAll();
			System.out.println(list.toString());
			*/

			//selectVo
			/*
			List<BoardVo> list=boardDao.selectAll();
			System.out.println(list.toString());
			BoardVo boardVo=boardDao.selectVo((long) 3);
			System.out.println(boardVo.getPlan_no()+" "+boardVo.getMessage());
			*/

			//update
			/*
			List<BoardVo> list=boardDao.selectAll();
			System.out.println(list.toString());
			BoardVo boardVo=boardDao.selectVo((long)3);
			boardVo.setMessage("이거 업데이트 되는건가요?");
			boardDao.update(boardVo);
			List<BoardVo> list2=boardDao.selectAll();
			System.out.println(list2.toString());
			*/
		
	}
	
	public void contentBox(){
		
		 //insert
		/*
		ContentBoxVo contentBoxVo=new ContentBoxVo();
		contentBoxVo.setPlan_no(2);
		contentBoxVo.setContent_no(6);
		contentBoxDao.insert(contentBoxVo);
		List<ContentBoxVo> list2=contentBoxDao.selectAll();
		System.out.println(list2.toString());
		*/

		//delete
		/*
		contentBoxDao.delete((long)2);
		List<ContentBoxVo> list=contentBoxDao.selectAll();
		System.out.println(list.toString());
		*/

		//selectVo
/*
		List<ContentBoxVo> list=contentBoxDao.selectAll();
		System.out.println(list.toString());
		ContentBoxVo contentBoxVo=contentBoxDao.selectVo((long) 3);
		System.out.println(contentBoxVo.getPlan_no()+" "+contentBoxVo.getContent_no());
		*/

		//update
		/*
		List<ContentBoxVo> list=contentBoxDao.selectAll();
		System.out.println(list.toString());
		ContentBoxVo contentBoxVo=contentBoxDao.selectVo((long)3);
		contentBoxVo.setContent_no(7);
		contentBoxDao.update(contentBoxVo);
		List<ContentBoxVo> list2=contentBoxDao.selectAll();
		System.out.println(list2.toString());
		*/
		
	}
	
	public void good(){
		
		 //insert
		/*
		GoodVo goodVo=new GoodVo();
		goodVo.setContent_no(5);
		goodVo.setMember_no(11);
		goodDao.insert(goodVo);
		List<GoodVo> list2=goodDao.selectAll();
		System.out.println(list2.toString());
		*/		
		
		//delete
		//goodDao.delete((long)2);
		//List<GoodVo> list=goodDao.selectAll();
		//System.out.println(list.toString());
		

		//selectVo
		/*
		List<GoodVo> list=goodDao.selectAll();
		System.out.println(list.toString());
		GoodVo goodVo=goodDao.selectVo((long) 2);
		System.out.println(goodVo.getGood_no()+" "+goodVo.getContent_no());
		*/
		
	}
	
	public void plan(){
		//insert
		
		/*
		PlanVo planVo=new PlanVo();
		planVo.setMember_no(11);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println(Calendar.getInstance().getTime());
		String strDate = sdf.format(Calendar.getInstance().getTime());
		System.out.println(strDate);
		planVo.setPlanDate(strDate);
		planVo.setTotalCost(20000);
		planVo.setTotalTime(150);
		planDao.insert(planVo);
		List<PlanVo> list2=planDao.selectAll();
		System.out.println(list2.toString());
		*/

		//delete
	//	planDao.delete((long)3);
	//	List<PlanVo> list=planDao.selectAll();
	//	System.out.println(list.toString());
		

		//selectVo
/*
		List<PlanVo> list=planDao.selectAll();
		System.out.println(list.toString());
		PlanVo planVo=planDao.selectVo((long) 2);
		System.out.println(planVo.getPlanDate()+" "+planVo.getTotalTime());

*/
		//update
		/*
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println(Calendar.getInstance().getTime());
		String strDate = sdf.format(Calendar.getInstance().getTime());
		System.out.println(strDate);
		
		List<PlanVo> list=planDao.selectAll();
		System.out.println(list.toString());
		PlanVo planVo=planDao.selectVo((long)2);
		planVo.setPlanDate("1992/09/22 00:20:55");
		planDao.update(planVo);
		List<PlanVo> list2=planDao.selectAll();
		System.out.println(list2.toString());
		*/
	}
	
	public void themeBox(){
		
		
		 //insert
				/*
				ThemeBoxVo themeBoxVo=new ThemeBoxVo();
				themeBoxVo.setMember_no(11);
				themeBoxVo.setTheme_no(2);
				themeBoxDao.insert(themeBoxVo);
				List<ThemeBoxVo> list2=themeBoxDao.selectAll();
				System.out.println(list2.toString());
				*/
		
		
				//delete
			//	themeBoxDao.delete((long)1);
			//	List<ThemeBoxVo> list=themeBoxDao.selectAll();
			//	System.out.println(list.toString());
				
		
				//selectVo
		/*
				List<ThemeBoxVo> list=themeBoxDao.selectAll();
				System.out.println(list.toString());
				ThemeBoxVo themeBoxVo=themeBoxDao.selectVo((long) 2);
				System.out.println(themeBoxVo.getTheme_no()+" "+themeBoxVo.getMember_no());
		*/
		
				//update
		/*
				List<ThemeBoxVo> list=themeBoxDao.selectAll();
				System.out.println(list.toString());
				ThemeBoxVo themeBoxVo=themeBoxDao.selectVo((long)2);
				themeBoxVo.setTheme_no(3);
				themeBoxDao.update(themeBoxVo);
				List<ThemeBoxVo> list2=themeBoxDao.selectAll();
				System.out.println(list2.toString());
		*/
	}
	
	public void member(){
		

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
	/*	
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		MemberVo memberVo=memberDao.selectVo((long) 11);
		memberVo.setMemberName("주우핫");
		memberDao.update(memberVo);
		List<MemberVo> list2=memberDao.selectAll();
		System.out.println(list2.toString());
		*/
		
	}
	
	public void theme(){
		
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
		
	}
	
}
				
		

