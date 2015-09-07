package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.bit2015.omu.vo.BoardVo;

public class BoardDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
/*	
	public List<BoardVo> selectAll() {
		List<BoardVo> list= sqlMapClientTemplate.queryForList("board.selectAll");
		return list;
	}*/

}
