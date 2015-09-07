package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.ContentVo;

@Repository
public class ContentDao {
  
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<ContentVo> selectAll(){
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectAll");
		return list;
	}
	
}
