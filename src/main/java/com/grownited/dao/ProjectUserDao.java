package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.ProjectBean;
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
		String joinQuery="select u.firstName,p.projectName,pu.projectUserId,pu.userId,pu.projectId,pu.assignStatus from project p,users u,projectuser pu where pu.userId=u.userId and pu.projectId=p.projectId";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<ProjectUserBean>(ProjectUserBean.class));
	
		
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
	
	//
	
	
public List<ProjectUserBean> getManagerProject(Integer userId){
		
		String selectQuery="select p.projectName,pu.assignStatus,pu.projectId from project p,projectuser pu where pu.projectId=p.projectId and userId=?";
		List<ProjectUserBean>listProject=stmt.query(selectQuery, new BeanPropertyRowMapper<>(ProjectUserBean.class),new Object[] {userId});
		return listProject;
	
		
	}
	public Integer getTotalProject() {
		String countQuery="select count(*) from projectuser";
		return stmt.queryForObject(countQuery, Integer.class);
	}
	
	public Integer getTotalRunningProject() {
		String countQuery="select count(*) from projectuser  where assignStatus=1";
		return stmt.queryForObject(countQuery, Integer.class);
		
	}
	
	public Integer getUtilizedHours() {
		String countQuery="select sum(p.utilizedHours ) from project p,projectuser pu where pu.projectId=p.projectId ";
		return stmt.queryForObject(countQuery, Integer.class);
	}

	

}















