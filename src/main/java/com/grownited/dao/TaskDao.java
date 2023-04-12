package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import com.grownited.bean.TaskBean;

@Repository
public class TaskDao {
	@Autowired
	
	JdbcTemplate stmt;
	public void addTask(TaskBean taskBean) {
		String insertQuery="insert into task(moduleId,statusId,projectId,taskName,estimatedHours,totalUtilizedHours,documentUrl,description)values(?,?,?,?,?,?,?,?)";
		
		stmt.update(insertQuery,taskBean.getModuleId(),taskBean.getStatusId(),taskBean.getProjectId(),taskBean.getTaskName(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription());
		
	}
	
	public List<TaskBean> getAllTask() {
		
		String selectQuery="select * from task";
		List<TaskBean>listTask=stmt.query(selectQuery, new BeanPropertyRowMapper<TaskBean>(TaskBean.class));
		return listTask;
		
	}
	
	public void deleteTask(Integer taskId) {
		String updateQuery="delete from task where taskId=?";
		stmt.update(updateQuery,taskId);
	}
	
	//list
	
	public TaskBean getTaskById(Integer taskId) {
		TaskBean taskBean=null;
		try {
			taskBean=stmt.queryForObject("select * from task where taskId=?",
					new BeanPropertyRowMapper<TaskBean>(TaskBean.class),new Object[] {taskId});
			
		}
		catch(Exception e) {
			System.out.println("TaskDao::getTaskById()");
			System.out.println(e.getMessage());
		}
		return taskBean;
	}
	
	
	//update
	
	public void updateTask (TaskBean taskBean) {
		String updateQuery="update task set taskName=? ,projectId=?,statusId=?,moduleId=?,estimatedHours=?,totalUtilizedHours=?,documentUrl=?,description where taskId=?";
		stmt.update(updateQuery,taskBean.getTaskName(),taskBean.getProjectId(),taskBean.getStatusId(),taskBean.getModuleId(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription(),taskBean.getTaskId());
		
	}
}
