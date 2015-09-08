package com.bit2015.omu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.omu.dao.MemberDao;
import com.bit2015.omu.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	public void join(MemberVo memberVo){
		memberDao.insert(memberVo);
	}
	
	public MemberVo login(MemberVo memberVo){
		MemberVo vo = memberDao.get(memberVo.getMemberId(), memberVo.getPassword());
		return vo;	
	}
}
