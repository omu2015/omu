package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.ContentBoxVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class ContentBoxDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public void insert(ContentBoxVo contentBoxVo){
		sqlMapClientTemplate.insert("contentBox.insert", contentBoxVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ContentBoxVo> selectAll(){
		List<ContentBoxVo> list= sqlMapClientTemplate.queryForList("contentBox.selectAll");
		return list;
	}
	
	public ContentBoxVo selectVo(Long contentBox_no){
		ContentBoxVo contentBoxVo = (ContentBoxVo) sqlMapClientTemplate.queryForObject("contentBox.selectVo", contentBox_no);
		return contentBoxVo;
	}

	public void delete(Long contentBox_no) {
		sqlMapClientTemplate.delete("contentBox.delete", contentBox_no);
	}
	
	public void update(ContentBoxVo contentBoxVo) {
		sqlMapClientTemplate.update("contentBox.update", contentBoxVo);
	}
}
