package com.bit2015.omu.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.util.FileUploader;
import com.bit2015.omu.vo.MemberVo;

@Service
public class MyPageService {
	@Autowired
	MemberDao memberDao;
	
	FileUploader ful=new FileUploader();

	/* 회원수정 */
	public void memberModify(HttpSession session,
			@ModelAttribute MemberVo memberVo, String repassword,
			String password1 ,MultipartFile img) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword().equals(password1));
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberName(memberVo.getMemberName());
			vo.setAddress(memberVo.getAddress());
			vo.setPassword(repassword);
			String member_img_url=ful.upload(img);
			vo.setImageUrl(member_img_url);
			vo.setPhoneNum1(memberVo.getPhoneNum1());
			vo.setPhoneNum2(memberVo.getPhoneNum2());
			vo.setPhoneNum3(memberVo.getPhoneNum3());
			vo.setEmail(memberVo.getEmail());
			vo.setZipcode(memberVo.getZipcode());
			memberDao.update(vo);
			System.out.println(vo);
		}
	}

	public void memberLeave(HttpSession session,
			@ModelAttribute MemberVo memberVo, String password1) {
		MemberVo vo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword());
		System.out.println(password1);
		System.out.println(memberDao.get(vo.getMemberId(), vo.getPassword())
				.getPassword().equals(password1));
		if (memberDao.get(vo.getMemberId(), vo.getPassword()).getPassword()
				.equals(password1)) {
			vo.setMemberStatus(memberVo.getMemberStatus());
			memberDao.update(vo);
			System.out.println(vo);
		} else {
			System.out.println("비번이 서로 달라");

		}
	}

}
