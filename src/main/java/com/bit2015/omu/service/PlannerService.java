package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.JusoDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.vo.JusoVo;

@Service
public class PlannerService {
	
	@Autowired
	PlanDao planDao;
	@Autowired
	JusoDao jusoDao;
	
	public List<JusoVo> getSi(){
		List<JusoVo> list = jusoDao.getSi();
		return list;
	}
	
	


}
