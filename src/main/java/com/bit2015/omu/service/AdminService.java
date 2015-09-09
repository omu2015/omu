package com.bit2015.omu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.vo.MemberVo;

@Service
@RequestMapping("/admin")
public class AdminService {
	
	@Autowired
	MemberDao memberDao;
	
	public void insertMember(MemberVo memberVo) {
		//System.out.println(memberVo.toString());
		memberDao.insert(memberVo);
		List<MemberVo> list=memberDao.selectAll();
		System.out.println(list.toString());
	}
	
	public void selectMember(MemberVo memberVo) {
		//	memberDao.insert(memberVo);
			//List<MemberVo> list=memberDao.selectAll();
		//	System.out.println(list.toString());
		}
	
	public void deleteMember(MemberVo memberVo) {
		//	memberDao.insert(memberVo);
			//List<MemberVo> list=memberDao.selectAll();
		//	System.out.println(list.toString());
		}
	
	public void modifyMember(MemberVo memberVo) {
		//	memberDao.insert(memberVo);
			//List<MemberVo> list=memberDao.selectAll();
		//	System.out.println(list.toString());
		}
	
	
	
	
	
}
				
		

