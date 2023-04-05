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
		List<StatusBean>listStatus=stmt.query(selectQuery, new BeanPropertyRowMapper<StatusBean>(StatusBean.class));
		return listStatus;
	}
	
	public void deleteStatus(Integer statusId) {
		
		String updateQuery="delete from status where statusId=?";
		stmt.update(updateQuery,statusId);
	}
	
	
	public StatusBean getStatusById(Integer statusId) {
		StatusBean statusBean=null;
		try {
			statusBean=stmt.queryForObject("select * from status where statusId=?",
					new BeanPropertyRowMapper<StatusBean>(StatusBean.class),new Object[] {statusId});
			
		}
		catch(Exception e) {
			System.out.println("StatusDao::getStatusById()");
			System.out.println(e.getMessage());
		}
		return statusBean;
	}
	
	
	//update
	
	public void updateStatus (StatusBean statusBean) {
		String updateQuery="update status set statusName=? where statusId=?";
		stmt.update(updateQuery,statusBean.getStatusName(),statusBean.getStatusId());
		
	}
	

}
