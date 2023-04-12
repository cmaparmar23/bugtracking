package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProjectUserBean;

@Repository
public class ProjectUserDao {
	
	@Autowired
	JdbcTemplate stmt;
	public void addProjectUser(ProjectUserBean projectUserBean) {
		String insertQuery="insert into projectUser(userId,projectId,assignStatus) values(?,?,?)";
		
		stmt.update(insertQuery,projectUserBean.getUserId(),projectUserBean.getProjectId(),projectUserBean.getAssignStatus());
	}
	
	public List<ProjectUserBean>getAllProjectUser(){
		
		String selectQuery= "select  *from projectUser"; 
		List<ProjectUserBean>listProjectUser=stmt.query(selectQuery, new BeanPropertyRowMapper<ProjectUserBean>(ProjectUserBean.class));
		return listProjectUser;
	}
	
	public void deleteProjectUser(Integer projectUserId) {
		
		String updateQuery="delete  from projectUser where projectUserId=?";
		stmt.update(updateQuery,projectUserId);
	}
	
	//list
	
	public ProjectUserBean getProjectUserById(Integer projectUserId) {
		ProjectUserBean projectUserBean=null;
		try {
			projectUserBean=stmt.queryForObject("select * from projectUser where projectUserId=?",
					new BeanPropertyRowMapper<ProjectUserBean>(ProjectUserBean.class),new Object[] {projectUserId});
			
		}
		catch(Exception e) {
			System.out.println("ProjectUserDao::getProjectUserById()");
			System.out.println(e.getMessage());
		}
		return projectUserBean;
	}
	
	public void updateProjectUser(ProjectUserBean projectUserBean) {
		String updateQuery="update projectuser set projectId=?,userId=?,assignStatus=? where projectUserId=?";
		stmt.update(updateQuery,projectUserBean.getUserId(),projectUserBean.getProjectId(),projectUserBean.getAssignStatus(),projectUserBean.getProjectUserId());
	}
	

}
