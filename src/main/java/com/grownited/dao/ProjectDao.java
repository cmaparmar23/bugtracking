package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProjectBean;

@Repository

public class ProjectDao {
	@Autowired
	JdbcTemplate stmt;
	public void addProject(ProjectBean projectBean) {
		String insertQuery="insert into project(title,description,technologyId,estimatedHours,startDate,completionDate,utilizedHours,statusId) values(?,?,?,?,?,?,?,?,)";
		
		stmt.update(insertQuery,projectBean.getTitle(),projectBean.getDescription(),projectBean.getTechnologyId(),projectBean.getEstimatedHours(),projectBean.getStartDate(),projectBean.getCompletionDate(),projectBean.getUtilizedHours(),projectBean.getStatusId());
	}
	
	public List<ProjectBean>getAllProject(){
		
		String selectQuery= "select  *from project"; 
		List<ProjectBean>listproject=stmt.query(selectQuery, new BeanPropertyRowMapper<ProjectBean>(ProjectBean.class));
		return listproject;
	}
	
	public void deleteProject(Integer projectId) {
		
		String updateQuery="delete from project where projectId=?";
		stmt.update(updateQuery,projectId);
	}
		
	}

	

