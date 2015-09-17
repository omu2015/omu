package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.BoardVo;
import com.bit2015.omu.vo.PlanVo;

@Repository
public class BoardDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(BoardVo boardVo){
		sqlMapClientTemplate.insert("board.insert", boardVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVo> selectAll(){
		List<BoardVo> list= sqlMapClientTemplate.queryForList("board.selectAll");
		return list;
	}
	
	public BoardVo selectVo(Long board_no){
		BoardVo boardVo = (BoardVo) sqlMapClientTemplate.queryForObject("board.selectVo", board_no);
		return boardVo;
	}
	
	public BoardVo selectVoByPno(Long plan_no){
		BoardVo boardVo = (BoardVo) sqlMapClientTemplate.queryForObject("board.selectVoByPno", plan_no);
		return boardVo;
	}

	public void delete(Long board_no) {
		sqlMapClientTemplate.delete("board.delete", board_no);
	}
	
	public void update(BoardVo boardVo) {
		sqlMapClientTemplate.update("board.update", boardVo);
	}
	
	
	
	
	
	
	
}
