package com.bit2015.omu.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.MainDao;
import com.bit2015.omu.vo.CommentsVo;

@Service
public class MainService {
  
	@Autowired
	MainDao mainDao;
	
	public void  insert (HttpSession session   ,@ModelAttribute CommentsVo commentsVo){
		CommentsVo  vo = (CommentsVo) session.getAttribute("authUser");
		System.out.println("ppp");
		  vo.setMessage(commentsVo.getMessage());
		  System.out.println(vo);
		  mainDao.insert(vo);
		  
	}
}
