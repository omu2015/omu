package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.vo.ContentVo;

@Service
public class PJYTestService2 {
    
	@Autowired
	ContentDao contentDao;
	
	public void test(){
		List<ContentVo> list = contentDao.selectAll();
		System.out.println(list.toString());
	}
}
