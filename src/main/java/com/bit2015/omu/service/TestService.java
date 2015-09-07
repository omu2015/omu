package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.ImgDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.MemberVo;

@Service
public class TestService {
	
	@Autowired
	BoardDao boardDao;
	
	public void test(){
		//List<BoardVo> list=boardDao.selectAll();
		List<BoardVo> list=ImgDao.selectAll();
		System.out.println(list.toString());
	}
}
