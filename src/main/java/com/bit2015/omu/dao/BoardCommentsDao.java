package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.BoardCommentsVo;
import com.bit2015.omu.vo.MemberVo;
import com.bit2015.omu.vo.PlanVo;
import com.bit2015.omu.vo.ThemeBoxVo;
import com.bit2015.omu.vo.ThemeVo;

@Repository
public class BoardCommentsDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(BoardCommentsVo boardCommentsVo){
		sqlMapClientTemplate.insert("boardComments.insert", boardCommentsVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardCommentsVo> selectAll(){
		List<BoardCommentsVo> list= sqlMapClientTemplate.queryForList("boardComments.selectAll");
		return list;
	}
	public List<BoardCommentsVo> selectAllByBno(Long board_no){
		List<BoardCommentsVo> list= sqlMapClientTemplate.queryForList("boardComments.selectAllByBno", board_no);
		return list;
	}
	
	public BoardCommentsVo selectVo(Long boardComments_no){
		BoardCommentsVo boardCommentsVo = (BoardCommentsVo) sqlMapClientTemplate.queryForObject("boardComments.selectVo", boardComments_no);
		return boardCommentsVo;
	}

	public void delete(Long boardComments_no) {
		sqlMapClientTemplate.delete("boardComments.delete", boardComments_no);
	}
	
	public void update(BoardCommentsVo boardCommentsVo) {
		sqlMapClientTemplate.update("boardComments.update", boardCommentsVo);
	}
}
