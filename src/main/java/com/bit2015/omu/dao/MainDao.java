package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;

@Repository
public class MainDao {
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<ContentVo> getList() {
		List<ContentVo> list = (List<ContentVo>) sqlMapClientTemplate.queryForList("content.selectAll");
		return list;
	}

	public List<CommentsVo> getList2() {
		List<CommentsVo> list2 = (List<CommentsVo>) sqlMapClientTemplate.queryForList("comments.selectAll");
		return list2;
	}
	
	public void insert(CommentsVo vo){
		sqlMapClientTemplate.insert("comments.insert",vo);
	}	
}