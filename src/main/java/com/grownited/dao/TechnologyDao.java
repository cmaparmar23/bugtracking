package com.grownited.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.TechnologyBean;

@Repository
public class TechnologyDao {
	@Autowired
	
	JdbcTemplate stmt;
	//add
	public void addTechnology(TechnologyBean technologyBean) {
		
		String insertQuery="insert into technology (technologyName,deleted) values(?,?)";
		stmt.update(insertQuery,technologyBean.getTechnologyName(),false);
				//insert//update//delete
		
		
	}
	public List<TechnologyBean> getAllTechnology() {

		String selectQuery = "select * from technology where deleted = false";

		List<TechnologyBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<TechnologyBean>(TechnologyBean.class));
		
		//c1 c2 c3 
		
		return list;
	}
	
	public void deleteTechnology(Integer technologyId) {
		String updateQuery="update technology set deleted =true where technologyId=?";
		stmt.update(updateQuery,technologyId);
		
	}
	public TechnologyBean getTechnologyById(Integer technologyId) {
		TechnologyBean technologyBean=null;
		try {
			technologyBean=stmt.queryForObject("select * from technology where technologyId=?",
					new BeanPropertyRowMapper<TechnologyBean>(TechnologyBean.class),new Object[] {technologyId});
			
		}
		catch(Exception e) {
			System.out.println("TechnologyDao::getTechnologyById()");
			System.out.println(e.getMessage());
		}
		return technologyBean;
	}
	
	
	//list
	
	
	//update
	
	//delete
	
	

}
