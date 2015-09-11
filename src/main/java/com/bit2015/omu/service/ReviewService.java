package com.bit2015.omu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
import com.bit2015.omu.util.FileUploader;
import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;
import com.bit2015.omu.vo.ViewVo;

@Service
public class ReviewService {
	
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
    
    FileUploader ful=new FileUploader();

	public void index(Model model) {
		//List<BoardVo> boardList=new ArrayList<BoardVo>();
		
		
		
		
		/*List<ViewVo> viewList=new ArrayList<ViewVo>();
    	List<ContentBoxVo> contentBoxList=contentBoxDao.selectAll();
    	
    	for (int i = 0; i < contentBoxList.size(); i++) {
    		ViewVo viewVo=new ViewVo();
    		long cbno=contentBoxList.get(i).getContentBox_no();
    		long cno=contentBoxList.get(i).getContent_no();
    		long pno=contentBoxList.get(i).getPlan_no();
    		long member_no=planDao.selectVo(pno).getMember_no();
    		
    		viewVo.setContentBox_no(cbno);
    		viewVo.setMember_no(member_no);
    		viewVo.setMemberName(memberDao.selectVo(member_no).getMemberName());
    		viewVo.setPlan_no(pno);
    		viewVo.setTitle(contentDao.selectVo(cno).getTitle());
    		viewVo.setCost(contentDao.selectVo(cno).getCost());
    		viewVo.setCost(contentDao.selectVo(cno).getTime());
    		viewVo.setTotalCost(planDao.selectVo(pno).getTotalCost());
    		viewVo.setTotalCost(planDao.selectVo(pno).getTotalTime());
    		
    		viewList.add(i, viewVo);
		}
    	
    	model.addAttribute("viewList", viewList);*/
	}
	
	public void mapview(Model model, HttpSession session){
		//1.session 생성
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		//System.out.println(memberVo.toString());
		//Error 500-> session이 없을 시...
		
		//2.themeBox 다 가져오기
		List<ThemeBoxVo> list=themeBoxDao.selectAll();
		//System.out.println("list.toString()="+list.toString());
		
		//3.임시 arraylist 생성 후 가입한 회원의 관심사 목록을 가져옴
		List<ThemeBoxVo> list2=new ArrayList<ThemeBoxVo>();
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getMember_no()==memberVo.getMember_no()){
				//System.out.println("list.get(i)="+list.get(i));
				list2.add((ThemeBoxVo)list.get(i));
			}
		}
		//4.회원의 관심사를 arraylist에다 넣기
		List<ThemeVo> list3=new ArrayList<ThemeVo>();
		for (int i = 0; i < list2.size(); i++) {
			System.out.println(themeDao.selectVo(list2.get(i).getTheme_no()).toString());
			list3.add(themeDao.selectVo(list2.get(i).getTheme_no()));
		}
		model.addAttribute("themeArray", list3);
		
		
	}
	
}
				
		

