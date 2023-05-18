package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProfileBean;
import com.grownited.bean.StatusChartBean;
@Repository

public class ProjectManagerDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	public List<StatusChartBean>getProjectStatus(){
		String selectQ=" select p.projectName,s.statusName from project p,status s where p.statusId=s.statusId";
		return stmt.query(selectQ, new BeanPropertyRowMapper<StatusChartBean>(StatusChartBean.class));
		
	}

	public void updateImageUrl(ProfileBean profileBean) {
		stmt.update("update users set imageUrl =? where userId=?",profileBean.getImageUrl(),profileBean.getUserId());
		
	}
	
	
	

}
