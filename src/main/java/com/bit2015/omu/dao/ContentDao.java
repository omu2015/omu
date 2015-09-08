package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.ContentVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class ContentDao {
  
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<ContentVo> selectAll(){
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectAll");
		return list;
	}

	public ContentVo selectVo(Long content_no ) {
		ContentVo vo = (ContentVo) sqlMapClientTemplate.queryForObject("content.selectVo",content_no);
		return vo;
	}
	public void insert(ContentVo contentVo){
		sqlMapClientTemplate.insert("content.insert", contentVo);
	}

	public void delete(long content_no) {
		sqlMapClientTemplate.delete("content.delete",content_no);
		
	}
	
}
