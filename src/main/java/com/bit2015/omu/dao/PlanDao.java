package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class PlanDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(PlanVo planVo){
		sqlMapClientTemplate.insert("plan.insert", planVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<PlanVo> selectAll(){
		List<PlanVo> list= sqlMapClientTemplate.queryForList("plan.selectAll");
		return list;
	}
	
	public PlanVo selectVo(Long plan_no){
		PlanVo planVo = (PlanVo) sqlMapClientTemplate.queryForObject("plan.selectVo", plan_no);
		return planVo;
	}

	public void delete(Long plan_no) {
		sqlMapClientTemplate.delete("plan.delete", plan_no);
	}
	
	public void update(PlanVo planVo) {
		sqlMapClientTemplate.update("plan.update", planVo);
	}
}
