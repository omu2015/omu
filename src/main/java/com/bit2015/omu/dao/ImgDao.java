package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit2015.omu.vo.ImgVo;


@Repository
public class ImgDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<ImgVo> selectAll() {
		List<ImgVo> list= sqlMapClientTemplate.queryForList("img.selectAll");
		return list;
	}
	
	public void insert(ImgVo imgVo){
		sqlMapClientTemplate.insert("img.insert",imgVo);
	}
	
}
