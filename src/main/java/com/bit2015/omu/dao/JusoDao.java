package com.bit2015.omu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.omu.vo.JusoVo;

@Repository
public class JusoDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<JusoVo> getSi(){
		List<JusoVo> list = sqlMapClientTemplate.queryForList("juso.getSi");
		return list;
	}
	public List<JusoVo> getGun(String si){
		List<JusoVo> list = sqlMapClientTemplate.queryForList("juso.getGun",si);
		return list;
	}
	public List<JusoVo> getDong(String si, String gun){
		Map<String, String> map = new HashMap<String, String>();
		map.put("si", si);
		map.put("gun", gun);
		
		List<JusoVo> list = sqlMapClientTemplate.queryForList("juso.getDong", map);
		
		return list;
	}

}
