package com.bit2015.omu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.CommentsVo;
import com.bit2015.omu.vo.ProductVo;

@Repository
public class ProductDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<ProductVo> selectAll() {
		List<ProductVo> list = sqlMapClientTemplate.queryForList("product.selectAll");
		return list;
	}
	
	public ProductVo selectVo(Long product_no ) {
		ProductVo vo = (ProductVo) sqlMapClientTemplate.queryForObject("product.selectVo",product_no);
		return vo;
	}

	public void insert(ProductVo productVo) {
		sqlMapClientTemplate.insert("product.insert",productVo);
    }

	public void delete(long product_no) {
		sqlMapClientTemplate.delete("product.delete",product_no);
	}

	public void update(ProductVo productVo) {
        sqlMapClientTemplate.update("product.update",productVo);		
	}
	
}
