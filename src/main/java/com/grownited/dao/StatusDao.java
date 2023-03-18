package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.StatusBean;

@Repository

public class StatusDao {
	@Autowired
	JdbcTemplate stmt;
	public void addStatus(StatusBean statusBean) {
		String insertQuery="insert into status(statusName) values(?)";
		
		stmt.update(insertQuery,statusBean.getStatusName());
	}
	
	public List<StatusBean>getAllStatus(){
		
		String selectQuery= "select  *from status"; 
		List<StatusBean>listproject=stmt.query(selectQuery, new BeanPropertyRowMapper<StatusBean>(StatusBean.class));
		return listproject;
	}
	
	public void deleteStatus(Integer statusId) {
		
		String updateQuery="delete from status where statusId=?";
		stmt.update(updateQuery,statusId);
	}
	

}
