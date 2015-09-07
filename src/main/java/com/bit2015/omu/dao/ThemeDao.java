package com.bit2015.omu.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class ThemeDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<ThemeVo> selectAll(){
		List<ThemeVo> list= sqlMapClientTemplate.queryForList("theme.selectAll");
		return list;
	}
	
	public void insert(ThemeVo themeVo){
		sqlMapClientTemplate.insert("theme.insert", themeVo);
	}
	
	
	
	
	
}
