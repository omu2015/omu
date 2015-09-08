package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.ImgBoxVo;
import com.bit2015.omu.vo.ProductVo;

@Repository
public class ImgBoxDao {
   @Autowired
   SqlMapClientTemplate sqlMapClientTemplate;

   public List<ImgBoxVo> selectAll() {
      List<ImgBoxVo> list = sqlMapClientTemplate.queryForList("imgBox.selectAll");
      return list;
   }

   public ImgBoxVo selectVo(Long imgBox_no ) {
      ImgBoxVo vo = (ImgBoxVo) sqlMapClientTemplate.queryForObject("imgBox.selectVo",imgBox_no);
      return vo;
   }

   public void insert(ImgBoxVo imgBoxVo) {
      sqlMapClientTemplate.insert("imgBox.insert",imgBoxVo);
   }

   public void delete(long imgBox_no) {
      sqlMapClientTemplate.delete("imgBox.delete",imgBox_no);      
   }

   public void update(ImgBoxVo imgBoxVo) {
       sqlMapClientTemplate.update("imgBox.update",imgBoxVo);      
   }
}