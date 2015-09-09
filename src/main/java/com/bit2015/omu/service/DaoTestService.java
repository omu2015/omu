package com.bit2015.omu.service;



import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.BoardCommentsDao;
import com.bit2015.omu.dao.BoardDao;
import com.bit2015.omu.dao.BoardImgBoxDao;
import com.bit2015.omu.dao.CommentsDao;
import com.bit2015.omu.dao.ContentBoxDao;
import com.bit2015.omu.dao.ContentDao;
import com.bit2015.omu.dao.GoodDao;
import com.bit2015.omu.dao.ImgBoxDao;
import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.dao.PlanDao;
import com.bit2015.omu.dao.ProductDao;
import com.bit2015.omu.dao.ThemeBoxDao;
import com.bit2015.omu.dao.ThemeDao;
import com.bit2015.omu.vo.BoardCommentsVo;
import com.bit2015.omu.vo.BoardImgBoxVo;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Service
public class DaoTestService {
	
	@Autowired
	BoardCommentsDao boardCommentsDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	BoardImgBoxDao boardImgBoxDao;
	@Autowired
	CommentsDao commnetsDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	GoodDao goodDao;
	@Autowired
	ImgBoxDao imgBoxDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	PlanDao planDao;
    @Autowired
    ProductDao  productDao;
    @Autowired
    ThemeBoxDao themeBoxDao;
    @Autowired
    ThemeDao themeDao;
    

	public void test() {
		
//////////1. member.xml
		/*
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		*/
		//insert
		/*
		MemberVo memberVo=new MemberVo();
		memberVo.setMemberId("woosungchu");
		memberVo.setMemberName("주우성");
		memberVo.setPassword("1234");
		memberVo.setImageUrl("abcd");
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
		memberVo.setZipcode("137-140");
		memberDao.insert(memberVo);
		System.out.println(memberVo.toString());
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		*/
		
		//delete
		/*
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		memberDao.delete((long)2);
		List<MemberVo> list2=memberDao.selectAll();
		System.out.println(list2.toString());
		*/
		
		//selectVo
		/*
		MemberVo memberVo=memberDao.selectVo((long) 4);
		System.out.println(memberVo.toString());
		*/
		
		//update
		/*
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
		MemberVo memberVo=memberDao.selectVo((long) 4);
		memberVo.setMemberName("주우핫");
		memberDao.update(memberVo);
		List<MemberVo> list2=memberDao.selectAll();
		System.out.println(list2.toString());
		*/
		

		//2.////////theme.xml

		//insert
		//ThemeVo themeVo=new ThemeVo();
		//themeVo.setThemeName("노래방");
		//themeDao.insert(themeVo);
		//themeVo.setThemeName("피시방");
		//themeDao.insert(themeVo);
		//List<ThemeVo> list=themeDao.selectAll();
		//System.out.println(list.toString());
		
		//delete
		//themeDao.delete((long)2);
		//List<ThemeVo> list=themeDao.selectAll();
		//System.out.println(list.toString());
		
		//selectVo
		//ThemeVo themeVo=themeDao.selectVo((long) 1);
		//System.out.println(themeVo.getTheme_no()+themeVo.getThemeName());
		
		//update
		//List<ThemeVo> list=themeDao.selectAll();
		//System.out.println(list.toString());
		//ThemeVo themeVo=themeDao.selectVo((long)1);
		//themeVo.setThemeName("주우성수정완료");
		//themeDao.update(themeVo);
		//List<ThemeVo> list2=themeDao.selectAll();
		//System.out.println(list2.toString());
		
		//3.themeBox
		 //insert
		
		//ThemeBoxVo themeBoxVo=new ThemeBoxVo();
		//themeBoxVo.setMember_no(1);
		//themeBoxVo.setTheme_no(1);
		//themeBoxDao.insert(themeBoxVo);
		//themeBoxDao.insert(themeBoxVo);
		//List<ThemeBoxVo> list2=themeBoxDao.selectAll();
		//System.out.println(list2.toString());
		


		//delete
		
		//List<ThemeBoxVo> list=themeBoxDao.selectAll();
		//System.out.println(list.toString());
		//themeBoxDao.delete((long)3);
		//List<ThemeBoxVo> list2=themeBoxDao.selectAll();
		//System.out.println(list2.toString());
		

		//selectVo

		//List<ThemeBoxVo> list=themeBoxDao.selectAll();
		//System.out.println(list.toString());
		//ThemeBoxVo themeBoxVo=themeBoxDao.selectVo((long) 2);
		//System.out.println(themeBoxVo.getTheme_no()+" "+themeBoxVo.getMember_no());


		//update
		
		//List<ThemeBoxVo> list=themeBoxDao.selectAll();
		//System.out.println(list.toString());
		//ThemeBoxVo themeBoxVo=themeBoxDao.selectVo((long)2);
		//themeBoxVo.setTheme_no(1);
		//themeBoxDao.update(themeBoxVo);
		//List<ThemeBoxVo> list2=themeBoxDao.selectAll();
		//System.out.println(list2.toString());

		/*content*/
		/*
		 * selectAll
		 * 
		 * List<ContentVo> list = contentDao.selectAll();
		 * System.out.println(list.toString());
		 */

		
		 // selectVo
		  
		   //ContentVo contentVo2=contentDao.selectVo((long) 1);
		 // System.out.println(contentVo2.toString());
		
      
		//insert
		/*
		ContentVo contentVo=new ContentVo();
		//contentVo.setContent_no(content_no);
		contentVo.setTheme_no(3);
	   //	contentVo.setRegDate();
		contentVo.setMember_no(1);
		contentVo.setPhone("01045124512");
		contentVo.setNewAddress("rodamdsad");
		contentVo.setImageUrl("sayhitome");
		contentVo.setDirection("동서");
		contentVo.setZipcode("1231231");
		contentVo.setPlaceUrl("www.localhost");
		contentVo.setId("woosun");
		contentVo.setTitle("LCR GS25점");
		contentVo.setCategory("술집");
		contentVo.setAddress("동작구 신사동");
		contentVo.setLongitude("37.18544");
		contentVo.setLatitude("126.546452");
		contentVo.setCost(1222);
		contentVo.setTime(240);
		contentDao.insert(contentVo);
		System.out.println(contentVo.toString());
		List<ContentVo> list=contentDao.selectAll();
		System.out.println(list.toString());
		*/
		
		/*delete*/
			/*	
		List<ContentVo> list=contentDao.selectAll();
		System.out.println(list.toString());
 		contentDao.delete((long)2);
	    List<ContentVo> list2=contentDao.selectAll();
		System.out.println(list2.toString());
		*/
		
		/*update*/
		//List<ContentVo> list=contentDao.selectAll();
		//System.out.println(list.toString());
		//ContentVo contentVo=contentDao.selectVo((long)1);
		//contentVo.setCost(101010);
		//contentVo.setTime(60);
		//contentDao.update(contentVo);
		//List<ContentVo> list2=contentDao.selectAll();
		//System.out.println(list2.toString());
	
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
		
		/*product*/
		
	/*	selectAll
	 *  List<ProductVo> list = productDao.selectAll();
		 System.out.println(list.toString());*/
	
		 /*selectVo
		 ProductVo productVo=productDao.selectVo((long) 3);
		 System.out.println(productVo.toString());*/
		
		/*insert*/
/*		ProductVo productVo =new ProductVo();
	    productVo.setProductName("가라오케");
	    productVo.setProductPrice(123456);
	    productVo.setContent_no(7);
		productDao.insert(productVo);
		System.out.println(productVo.toString());
		List<ProductVo> list=productDao.selectAll();
		System.out.println(list.toString());*/
		
		/*delete*/
/*		productDao.delete((long)2);
	    List<ProductVo> list=productDao.selectAll();
		System.out.println(list.toString());*/
	   
		/*update*/
		/*List<ProductVo> list=productDao.selectAll();
		System.out.println(list.toString());
		ProductVo productVo=productDao.selectVo((long)3);
		productVo.setProductName("강남가라오케");
		productVo.setProductPrice(9999999);
		//productVo.setContent_no(7);
		productDao.update(productVo);
		List<ProductVo> list2=productDao.selectAll();
		System.out.println(list2.toString());*/
		
		   /*imgbox*/
	      
	      //selectAll
	      
	     /*
	      List<ImgBoxVo> list = imgBoxDao.selectAll();
	      System.out.println(list.toString());
	  */
	      
	      //selectVo
	      
	      /*   
	       ImgBoxVo imgBoxVo=imgBoxDao.selectVo((long) 3);
	      System.out.println(imgBoxVo.toString());
	      */
	      
	      //insert
	   
	      /*   
	       ImgBoxVo imgBoxVo =new ImgBoxVo();
	      imgBoxVo.setContent_no(2);
	      imgBoxVo.setImageURL("머지머지");;
	      imgBoxDao.insert(imgBoxVo);
	      System.out.println(imgBoxVo.toString());
	      List<ImgBoxVo> list=imgBoxDao.selectAll();
	      System.out.println(list.toString());
	      */
	      
	      //delete
	   
	      /*   
	       imgBoxDao.delete((long)5);
	       List<ImgBoxVo> list=imgBoxDao.selectAll();
	      System.out.println(list.toString());
	      */
	      
	      //update
	      
	      /*
	       List<ImgBoxVo> list=imgBoxDao.selectAll();
	      System.out.println(list.toString());
	      ImgBoxVo imgBoxVo=imgBoxDao.selectVo((long)1);
	      imgBoxVo.setImageURL("주우성과 함께하는 테스트");;
	      imgBoxDao.update(imgBoxVo);
	      List<ImgBoxVo> list2=imgBoxDao.selectAll();
	      System.out.println(list2.toString());
	      */
	
		
		//insert
		/*
				BoardImgBoxVo boardImgBoxVo=new BoardImgBoxVo();
				boardImgBoxVo.setBoard_no(4);
				boardImgBoxVo.setImageURL("sdfsdfsdfsdf/google");
				boardImgBoxDao.insert(boardImgBoxVo);
				List<BoardImgBoxVo> list2=boardImgBoxDao.selectAll();
				System.out.println(list2.toString());
				*/
				
				//delete
				/*
				boardImgBoxDao.delete((long)2);
				List<BoardImgBoxVo> list=boardImgBoxDao.selectAll();
				System.out.println(list.toString());
				*/

				//selectVo
				/*
				List<BoardImgBoxVo> list=boardImgBoxDao.selectAll();
				System.out.println(list.toString());
				BoardImgBoxVo boardImgBoxVo=boardImgBoxDao.selectVo((long) 3);
				System.out.println(boardImgBoxVo.getImageURL()+" "+boardImgBoxVo.getBoardImgBox_no());
				*/

				//update
				/*
				List<BoardImgBoxVo> list=boardImgBoxDao.selectAll();
				System.out.println(list.toString());
				BoardImgBoxVo boardImgBoxVo=boardImgBoxDao.selectVo((long)3);
				boardImgBoxVo.setImageURL("BoardImgBoxDao update 테스트");
				boardImgBoxDao.update(boardImgBoxVo);
				List<BoardImgBoxVo> list2=boardImgBoxDao.selectAll();
				System.out.println(list2.toString());
				*/
		
	
		
		//insert
		/*
		BoardCommentsVo boardCommentsVo=new BoardCommentsVo();
		boardCommentsVo.setMember_no(11);
		boardCommentsVo.setMessage("세번째들어간다");
		boardCommentsVo.setBoard_no(3);
		boardCommentsDao.insert(boardCommentsVo);
		List<BoardCommentsVo> list2=boardCommentsDao.selectAll();
		System.out.println(list2.toString());
		*/
		
		//delete
		/*
		boardCommentsDao.delete((long)2);
		List<BoardCommentsVo> list=boardCommentsDao.selectAll();
		System.out.println(list.toString());
		*/

		//selectVo
		/*
		List<BoardCommentsVo> list=boardCommentsDao.selectAll();
		System.out.println(list.toString());
		BoardCommentsVo boardConmmentsVo=boardCommentsDao.selectVo((long) 3);
		System.out.println(boardConmmentsVo.getMember_no()+" "+boardConmmentsVo.getMessage());
		*/

		//update
		/*
		List<BoardCommentsVo> list=boardCommentsDao.selectAll();
		System.out.println(list.toString());
		BoardCommentsVo boardCommentsVo=boardCommentsDao.selectVo((long)3);
		boardCommentsVo.setMessage("boardCommentsDao update 테스트");
		boardCommentsDao.update(boardCommentsVo);
		List<BoardCommentsVo> list2=boardCommentsDao.selectAll();
		System.out.println(list2.toString());
		*/
	
		
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
	
}
				
		

