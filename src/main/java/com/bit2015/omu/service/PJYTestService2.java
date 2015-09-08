package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;

@Service
public class PJYTestService2 {

	@Autowired
	ContentDao contentDao;
    @Autowired
    CommentsDao commentsDao;

	public void test() {
		
		
		/*content*/
		/*
		 * selectAll
		 * 
		 * List<ContentVo> list = contentDao.selectAll();
		 * System.out.println(list.toString());
		 */

		/*
		 * selectVo
		 * 
		 *  ContentVo contentVo=contentDao.selectVo((long) 2);
		 * System.out.println(contentVo.toString());
		 */
      
		/*insert
		ContentVo contentVo=new ContentVo();
		//contentVo.setContent_no(content_no);
		contentVo.setTheme_no(3);
	   //	contentVo.setRegDate();
		contentVo.setMember_no(11);
		contentVo.setPhone("010-9085-2738");
		contentVo.setNewAddress("www.naver.com");
		contentVo.setImageURL("www.daum.com");
		contentVo.setDirection("나침반");
		contentVo.setZipCode("1231231");
		contentVo.setPlaceURL("www.localhost");
		contentVo.setId("pjy");
		contentVo.setTitle("유흥주점");
		contentVo.setCategory("술집");
		contentVo.setAddress("강남");
		contentVo.setLongitude("37.18544");
		contentVo.setLatitude("126.546452");
		contentVo.setCost(555555);
		contentVo.setTime(120);
		contentDao.insert(contentVo);
		System.out.println(contentVo.toString());
		List<ContentVo> list=contentDao.selectAll();
		System.out.println(list.toString());*/
		
		/*delete*/
/*		contentDao.delete((long)4);
	    List<ContentVo> list=contentDao.selectAll();
		System.out.println(list.toString());*/
		
		/*update*/
		/*	List<ContentVo> list=contentDao.selectAll();
		System.out.println(list.toString());
		ContentVo contentVo=contentDao.selectVo((long)5);
		contentVo.setPhone("번호 바꿔");
		contentVo.setId("아이디바꿔");
		contentVo.setTitle("타이틀바꿔");
		contentDao.update(contentVo);
		List<ContentVo> list2=contentDao.selectAll();
		System.out.println(list2.toString());*/
	
	  /*comments*/
		/*selectAll*/
		  
		  //List<CommentsVo> list = commentsDao.selectAll();
		 // System.out.println(list.toString());
		
		 //selectVo
/*		  CommentsVo commentsVo=commentsDao.selectVo((long) 2);
		  System.out.println(commentsVo.toString());*/
		 //insert
		/*
		   CommentsVo commentsVo =new CommentsVo();
		    commentsVo.setMember_no(11);
		    commentsVo.setContent_no(5);
		    commentsVo.setMessage("주우성주우성주우성주우성");
			commentsDao.insert(commentsVo);
			System.out.println(commentsVo.toString());
			List<CommentsVo> list=commentsDao.selectAll();
			System.out.println(list.toString());
*/		
		/*delete*/
		
		/*commentsDao.delete((long)1);
	    List<CommentsVo> list=commentsDao.selectAll();
		System.out.println(list.toString());*/
		
		/*update*/
		
		/*List<CommentsVo> list=commentsDao.selectAll();
		System.out.println(list.toString());
		CommentsVo commentsVo=commentsDao.selectVo((long)4);
		commentsVo.setMessage("주우성천재");
		commentsDao.update(commentsVo);
		List<CommentsVo> list2=commentsDao.selectAll();
		System.out.println(list2.toString());*/
	
	}
}
