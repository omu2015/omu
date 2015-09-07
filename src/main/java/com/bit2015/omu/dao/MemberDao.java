package com.bit2015.omu.dao;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void selectAll(){
		
	}
	// 회원가입
	public void insert(MemberVo memberVo){
		sqlMapClientTemplate.insert("member.insert", memberVo);
	}
}
