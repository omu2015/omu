package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.JusoDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ThemeDao;
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
	public void addCart(ContentVo contentVo, String themeName, String id, long member_no){
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
			}else{
				contentVo.setTheme_no(themeVo.getTheme_no());
				contentVo.setMember_no(member_no);
				contentDao.insert(contentVo);
				ContentVo cntVo = contentDao.selectVoById(id);
				cntVo.getContent_no();
				}
			}else{
				System.out.println(testContentVo);
			}
		}
	public void addPlan(PlanVo planVo){
		planDao.insert(planVo);
	}
	public List<PlanVo> showPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		return list ; 
	}
	


}
