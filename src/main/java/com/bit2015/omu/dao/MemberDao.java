package com.bit2015.omu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class MemberDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(MemberVo memberVo){
		sqlMapClientTemplate.insert("member.insert", memberVo);
	}
	public List<MemberVo> selectAll(){
		List<MemberVo> list= sqlMapClientTemplate.queryForList("member.selectAll");
		return list;
	}
	public List<MemberVo> selectId(String memberId){
		List<MemberVo> list= sqlMapClientTemplate.queryForList("member.selectId", memberId);
		return list;
	}
	
	public MemberVo selectVo(Long member_no){
		MemberVo memberVo = (MemberVo) sqlMapClientTemplate.queryForObject("member.selectVo", member_no);
		return memberVo;
	}

	public void delete(long member_no) {
		sqlMapClientTemplate.delete("member.delete", member_no);
	}
	
	public void update(MemberVo memberVo) {
		sqlMapClientTemplate.update("member.update", memberVo);
	}
	
	public MemberVo get(String memberId, String password){
		Map<String, String> map  = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("password", password);
	
		MemberVo vo = (MemberVo)sqlMapClientTemplate.queryForObject("member.getbyIdAndPassword", map);
		return vo;
	}
	
	public  void memberLeave (MemberVo memberVo){
		sqlMapClientTemplate.update("member.memberLeave",memberVo);
	}
	
	
	
	
	
	
	
	
	
	
}
