package com.bit2015.omu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class MainDao {
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<ContentVo> getList() {
		List<ContentVo> list = (List<ContentVo>) sqlMapClientTemplate.queryForList("content.selectAll");
		return list;
	}
	
	public void insert(ContentVo contentVo){
		sqlMapClientTemplate.insert("content.insert",contentVo);
	} 
	

	public List<CommentsVo> getList2() {
		List<CommentsVo> list2 = (List<CommentsVo>) sqlMapClientTemplate.queryForList("comments.selectAll");
		return list2;
	}
	
	public List<ThemeVo> getList3(){
		List<ThemeVo> list3 = (List<ThemeVo>) sqlMapClientTemplate.queryForList("theme.selectAll");
		return list3;
	}
	
	public void insert(CommentsVo commentsVo){
		sqlMapClientTemplate.insert("comments.insert",commentsVo);
	}	
	public ThemeVo getNo(String themeName){
		ThemeVo vo = (ThemeVo) sqlMapClientTemplate.queryForObject("theme.getNo", themeName);
		return vo;
	}	
	
	
	public PlanVo getUserPlan(Long member_no){
		Map<String, Long> map = new HashMap<String, Long>();
		map.put( "member_no", member_no );
		PlanVo planVo = (PlanVo) sqlMapClientTemplate.queryForObject("plan.getUserPlan", map);
		return planVo;
	}
}