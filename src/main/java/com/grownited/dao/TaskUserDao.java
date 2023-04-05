package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.TaskUserBean;

@Repository

public class TaskUserDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	public void addTaskUser(TaskUserBean taskUserBean) {
		String insertQuery="insert into taskUser(userId,taskId,assignStatus,statusId,utilizedHours) values(?,?,?,?,?)";
		
		stmt.update(insertQuery,taskUserBean.getUserId(),taskUserBean.getTaskId(),taskUserBean.getAssignStatus(),taskUserBean.getStatusId(),taskUserBean.getUtilizedHours());
	}
	
	public List<TaskUserBean>getAllTaskUser(){
		
		String selectQuery= "select  *from taskUser"; 
		List<TaskUserBean>listTaskUser=stmt.query(selectQuery, new BeanPropertyRowMapper<TaskUserBean>(TaskUserBean.class));
		return listTaskUser;
	}
	
	public void deleteTaskUser(Integer taskUserId) {
		
		String updateQuery="delete  from taskUser where taskUserId=?";
		stmt.update(updateQuery,taskUserId);
	}
	
	//list
	
	public TaskUserBean getTaskUserById(Integer taskUserId) {
		TaskUserBean taskUserBean=null;
		try {
			taskUserBean=stmt.queryForObject("select * from taskUser where taskUserId=?",
					new BeanPropertyRowMapper<TaskUserBean>(TaskUserBean.class),new Object[] {taskUserId});
			
		}
		catch(Exception e) {
			System.out.println("TaskUserDao::getTaskUserById()");
			System.out.println(e.getMessage());
		}
		return taskUserBean;
	}
	
	

}