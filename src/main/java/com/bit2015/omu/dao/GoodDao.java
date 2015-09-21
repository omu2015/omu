package com.bit2015.omu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.GoodVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class GoodDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(GoodVo goodVo){
		sqlMapClientTemplate.insert("good.insert", goodVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<GoodVo> selectAll(){
		List<GoodVo> list= sqlMapClientTemplate.queryForList("good.selectAll");
		return list;
	}
	
	public GoodVo selectVoCnoMno(Long content_no , Long member_no){
		Map<String, Long> map = new HashMap<String, Long>();
		map.put( "content_no", content_no );
		map.put( "member_no", member_no );
		GoodVo goodVo = (GoodVo) sqlMapClientTemplate.queryForObject("good.selectVoCnoMno", map);
		return goodVo;
	}
	
	public GoodVo selectVo(Long good_no){
		GoodVo goodVo = (GoodVo) sqlMapClientTemplate.queryForObject("good.selectVo", good_no);
		return goodVo;
	}

	public void delete(Long good_no) {
		sqlMapClientTemplate.delete("good.delete", good_no);
	}
	
	
	public List<GoodVo> selectAllByCno(Long content_no) {
		List<GoodVo> list=sqlMapClientTemplate.queryForList("good.selectAllByCno", content_no);
		return list;
	}
	
	/*
	GoodVo는 update식이 아닌 지우고 키는 그런 방식으로 해야함. 
	따라서 update는 막아놈.
	public void update(GoodVo goodVo) {
		sqlMapClientTemplate.update("good.update", goodVo);
	}
	*/
	
}
