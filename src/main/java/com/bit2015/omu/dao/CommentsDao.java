package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;

@Repository
public class CommentsDao {
   
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<CommentsVo> selectAll(){
		List<CommentsVo> list= sqlMapClientTemplate.queryForList("comments.selectAll");
		return list;
	}
	
	public CommentsVo selectVo(Long comments_no ) {
		CommentsVo vo = (CommentsVo) sqlMapClientTemplate.queryForObject("comments.selectVo",comments_no);
		return vo;
	}

	public void insert(CommentsVo commentsVo) {
            sqlMapClientTemplate.insert("comments.insert",commentsVo);		
	}

	public void delete(long comments_no) {
		   sqlMapClientTemplate.delete("comments.delete",comments_no);
	}

	public void update(CommentsVo commentsVo) {
		   sqlMapClientTemplate.update("comments.update",commentsVo);
	}

	
}
