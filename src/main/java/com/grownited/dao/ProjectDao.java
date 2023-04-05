package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProjectBean;
import com.grownited.bean.TechnologyBean;
import com.grownited.bean.ProjectBean;

@Repository

public class ProjectDao {
	@Autowired
	JdbcTemplate stmt;
	public void addProject(ProjectBean projectBean) {
		String insertQuery="insert into project(projectName,description,Id,estimatedHours,startDate,completionDate,utilizedHours,statusId,deleted) values(?,?,?,?,?,?,?,?,?)";
		
		stmt.update(insertQuery,projectBean.getProjectName(),projectBean.getDescription(),projectBean.getProjectId(),projectBean.getEstimatedHours(),projectBean.getStartDate(),projectBean.getCompletionDate(),projectBean.getUtilizedHours(),projectBean.getStatusId(),false);
	}
	
	public List<ProjectBean>getAllProject(){
		
		String joinQuery = "select t.technologyName , p.technologyId,p.projectId,p.projectName,p.deleted ,p.statusId from technology t , project p where t.technologyId = p.technologyId and p.deleted = false";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<ProjectBean>(ProjectBean.class));
	
	
		
	}
	
	public void deleteProject(Integer projectId) {
		
		String updateQuery="update project set deleted =true where projectId=?";
		stmt.update(updateQuery,projectId);
	}
	

	
	public ProjectBean getProjectById(Integer projectId) {
		ProjectBean projectBean=null;
		try {
			projectBean=stmt.queryForObject("select * from project where projectId=?",
					new BeanPropertyRowMapper<ProjectBean>(ProjectBean.class),new Object[] {projectId});
			
		}
		catch(Exception e) {
			System.out.println("ProjectDao::getProjectById()");
			System.out.println(e.getMessage());
		}
		return projectBean;
	}
	
	
	//update
	
	//public void updateProject (ProjectBean projectBean) {
	//	String updateQuery="update project set projectName=?, technologyId=? , description=?,estimatedHours=?,startDate=?,completionDate=?,utilizedHours=?,statusId=? where projectId=?";
		//stmt.update(updateQuery,projectBean.getProjectName(),projectBean.getTechnologyId(),projectBean.getDescription(),projectBean.getEstimatedHours(),projectBean.getStartDate(),projectBean.getCompletionDate(),projectBean.getUtilizedHours(),projectBean.getStatusId());
		
	//}
	public void updateProject(ProjectBean projectBean) {
		String updateQuery="update project set projectName=? , technologyId=? ,estimatedHours=?,startDate=?,completionDate=?,utilizedHours=?,statusId=? where projectId=?";
	stmt.update(updateQuery,projectBean.getProjectName(),projectBean.getTechnologyId(),projectBean.getEstimatedHours(),projectBean.getStartDate(),projectBean.getCompletionDate(),projectBean.getUtilizedHours(),projectBean.getStatusId(),projectBean.getProjectId());
		
	}
	
		
	}

	

