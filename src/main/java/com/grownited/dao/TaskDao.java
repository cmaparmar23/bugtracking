package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProjectBean;
import com.grownited.bean.TaskBean;

@Repository
public class TaskDao {
	@Autowired
	
	JdbcTemplate stmt;
	public void addTask(TaskBean taskBean) {
		String insertQuery="insert into task(taskName,projectId,estimatedHours,totalUtilizedHours,documentUrl,description)values(?,?,?,?,?,?)";
		
		stmt.update(insertQuery,taskBean.getTaskName(),taskBean.getProjectId(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription());
		
	}
	
	public List<TaskBean> getAllTask() {
		
		String selectQuery="select * from task";
		List<TaskBean>listtask=stmt.query(selectQuery, new BeanPropertyRowMapper<TaskBean>(TaskBean.class));
		return listtask;
		
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
	

	

}
