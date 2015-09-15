package com.bit2015.omu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.JusoDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.JusoVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class PlannerService {
	
	@Autowired
	PlanDao planDao;
	@Autowired
	JusoDao jusoDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	
	public List<JusoVo> getSi(){
		List<JusoVo> list = jusoDao.getSi();
		return list;
	}
	public List<JusoVo> getFirstGun(){
		List<JusoVo> list = jusoDao.getFirstGun();
		return list;
	}
	public List<JusoVo> getGun(String si){
		List<JusoVo> list = jusoDao.getGun(si);
		return list;
	}
	public List<JusoVo> getDong(String si, String gun){
		List<JusoVo> list = jusoDao.getDong(si, gun);
		return list;
	}
	public void addCart(ContentVo contentVo, String themeName, String id, Long member_no, Long plan_no){
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
			Long content_no = cntVo.getContent_no();
			ContentBoxVo contentBoxVo = new ContentBoxVo();
			contentBoxVo.setPlan_no(plan_no);
			contentBoxVo.setContent_no(content_no);
			
			contentBoxDao.insert(contentBoxVo);
			
			}else{
				contentVo.setTheme_no(themeVo.getTheme_no());
				contentVo.setMember_no(member_no);
				contentDao.insert(contentVo);
				ContentVo cntVo = contentDao.selectVoById(id);
				Long content_no = cntVo.getContent_no();
				ContentBoxVo contentBoxVo = new ContentBoxVo();
				contentBoxVo.setPlan_no(plan_no);
				contentBoxVo.setContent_no(content_no);
				
				contentBoxDao.insert(contentBoxVo);
				
				}
			}else{
				ContentVo cntVo = contentDao.selectVoById(id);
				Long content_no = cntVo.getContent_no();
				ContentBoxVo contentBoxVo = new ContentBoxVo();
				contentBoxVo.setPlan_no(plan_no);
				contentBoxVo.setContent_no(content_no);
				
				contentBoxDao.insert(contentBoxVo);
			}
		}
	public void addPlan(PlanVo planVo){
		planDao.insert(planVo);
	}
	public List<PlanVo> showPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		return list ; 
	}
	public PlanVo getPlanNo(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		PlanVo planVo = new PlanVo();
		planVo = list.get(0);
		String planDate = planVo.getPlanDate();
		planVo.setPlanDate((planDate.split(" ")[0]));
		return planVo;
	}
	public List<ContentVo> getContentNo(Long plan_no){
		List<ContentBoxVo> list = contentBoxDao.selectAllByPno(plan_no);
		List<ContentVo> contentList = new ArrayList<ContentVo>();
		ContentVo contentVo = new ContentVo();
		for(int i=0; i<list.size(); i++){
			ContentBoxVo contentBoxVo = list.get(i);
			Long cntBoxNo = contentBoxVo.getContent_no();
			contentVo = contentDao.selectVo(cntBoxNo);
			contentList.add(contentVo);
		}
		return contentList;
	}
	public PlanVo getPlanDate(Long plan_no){
		PlanVo planVo = planDao.selectVo(plan_no);
		String planDate = planVo.getPlanDate();
		planVo.setPlanDate((planDate.split(" ")[0]));
		return planVo;
	}
	


}
