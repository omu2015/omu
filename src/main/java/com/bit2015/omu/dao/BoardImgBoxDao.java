package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.BoardImgBoxVo;
import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ContentVo;

@Repository
public class BoardImgBoxDao {
   
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<BoardImgBoxVo> selectAll(){
		List<BoardImgBoxVo> list= sqlMapClientTemplate.queryForList("boardImgBox.selectAll");
		return list;
	}
	
	public BoardImgBoxVo selectVo(Long boardImgBox_no ) {
		BoardImgBoxVo vo = (BoardImgBoxVo) sqlMapClientTemplate.queryForObject("boardImgBox.selectVo",boardImgBox_no);
		return vo;
	}

	public void insert(BoardImgBoxVo boardImgBoxVo) {
            sqlMapClientTemplate.insert("boardImgBox.insert",boardImgBoxVo);		
	}

	public void delete(long boardImgBox_no) {
		   sqlMapClientTemplate.delete("boardImgBox.delete",boardImgBox_no);
	}

	public void update(BoardImgBoxVo boardImgBoxVo) {
		   sqlMapClientTemplate.update("boardImgBox.update",boardImgBoxVo);
	}

	
}
