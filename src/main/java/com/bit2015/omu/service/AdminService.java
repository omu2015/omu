package com.bit2015.omu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;
import com.bit2015.omu.vo.ViewVo;

@Service
@RequestMapping("/admin")
public class AdminService {
	
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
    
    public List<ViewVo> selectView(){
    	List<ViewVo> viewList=new ArrayList<ViewVo>();
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
    	
    	
    	
    	return viewList;
    }
    
	public void insertMember(MemberVo memberVo, MultipartFile img) {
		if(img==null){
			System.out.println("!");
			memberVo.setImageUrl("");
		}else{
			String member_img_url=ful.upload(img);
			System.out.println("member_img_url = "+member_img_url);
			memberVo.setImageUrl(member_img_url);
		}
		memberDao.insert(memberVo);
	}
	
	public List<MemberVo> selectMember() {
		List<MemberVo> memberList=memberDao.selectAll();
		return memberList;
		}
	
	public void deleteMember(Long member_no) {
		memberDao.delete(member_no);
		}
	
	public void insertContent(ContentVo contentVo) {
		contentDao.insert(contentVo);
	}

	public List<ContentVo> selectContent() {
		List<ContentVo> contentList=contentDao.selectAll();
		return contentList;
	}

	public void deleteContent(Long content_no) {
		System.out.println("content_no = "+content_no);
		contentDao.delete(content_no);
	}
	
	
	
	public void insertTheme(ThemeVo themeVo) {
		themeDao.insert(themeVo);
	}
	public List<ThemeVo> selectTheme() {
		List<ThemeVo> list=themeDao.selectAll();
		return list;
	}
	public void deleteTheme(Long theme_no) {
		contentDao.delete(theme_no);
	}
	
	
	public void insertPlan(PlanVo planVo) {
		System.out.println(planVo.getPlanDate());
			planDao.insert(planVo);
		
	}
	public List<PlanVo> selectPlan() {
		List<PlanVo> list=planDao.selectAll();
		return list;
	}
	public void deletePlan(Long plan_no) {
		planDao.delete(plan_no);
	}
	
	
	
	
	public void insertContentBox(ContentBoxVo contentBoxVo) {
		System.out.println(contentBoxVo.toString());
		contentBoxDao.insert(contentBoxVo);
	}
	public List<ContentBoxVo> selectContentBox() {
		List<ContentBoxVo> list=contentBoxDao.selectAll();
		return list;
	}
	public void deleteContentBox(Long contentBox_no) {
		contentBoxDao.delete(contentBox_no);
	}

	
	
	
	public void insertThemeBox(ThemeBoxVo themeBoxVo) {
		System.out.println(themeBoxVo.toString());
		themeBoxDao.insert(themeBoxVo);
	}
	public List<ThemeBoxVo> selectThemeBox() {
		List<ThemeBoxVo> list=themeBoxDao.selectAll();
		return list;
	}
	public void deleteThemeBox(Long themeBox_no) {
		themeBoxDao.delete(themeBox_no);
	}

	
	
	public void insertBoard(BoardVo boardVo) {
		System.out.println(boardVo.toString());
		boardVo.setMember_no(planDao.selectVo(boardVo.getPlan_no()).getMember_no());
		System.out.println(boardVo.toString());
		boardDao.insert(boardVo);
	}
	public List<BoardVo> selectBoard() {
		List<BoardVo> list=boardDao.selectAll();
		return list;
	}
	public void deleteBoard(Long board_no) {
		boardDao.delete(board_no);
	}
	
	
	
	public void insertGood(GoodVo goodVo) {
		System.out.println(goodVo.toString());
		goodDao.insert(goodVo);
	}
	public List<GoodVo> selectGood() {
		List<GoodVo> list=goodDao.selectAll();
		return list;
	}
	public void deleteGood(Long good_no) {
		goodDao.delete(good_no);
	}

}
				
		

