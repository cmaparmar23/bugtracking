package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.ProjectUserBean;
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
		
		String joinQuery="select u.firstName,s.statusName,t.taskName,tu.taskUserId,tu.userId,tu.statusId,tu.taskId,tu.assignStatus,tu.utilizedHours from users u,task t,status s ,taskUser tu where tu.userId=u.userId and tu.statusId=s.statusId and tu.taskId=t.taskId";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<TaskUserBean>(TaskUserBean.class));

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
	
	public void updateTaskUser(TaskUserBean taskUserBean) {
		String updateQuery="update taskuser set taskId=?,userId=?,statusId=?,assignStatus=?,utilizedHours where taskUserId=?";
		stmt.update(updateQuery,taskUserBean.getTaskId(),taskUserBean.getUserId(),taskUserBean.getStatusId(),taskUserBean.getAssignStatus(),taskUserBean.getUtilizedHours(),taskUserBean.getTaskUserId());
	}
	
	
//devloper task
	
	public List<TaskUserBean>getDevAllTask(Integer userId){
		String selectQuery="select p.projectName,tu.assignStatus,s.statusName,tu.utilizedHours from taskuser tu,users u,task t,project p,status s where tu.taskId=t.taskId and t.projectId=p.projectId and tu.statusId=s.statusId and tu.userId=u.userId and u.userId=?";
		List<TaskUserBean>devlist7=stmt.query(selectQuery, new BeanPropertyRowMapper<>(TaskUserBean.class),new Object[] {userId});
		return devlist7;
	}
	
	public Integer getTotalTask(Integer userId) {
		String countQuery="select count(*) from taskuser where userId=?";
		return stmt.queryForObject(countQuery, Integer.class,new Object[] {userId});
	}
	
	
	public Integer getInprogressTask(Integer userId) {
		String countQuery="select count(*) from taskuser where userId=? and statusId=3"; //progress
		return stmt.queryForObject(countQuery, Integer.class,new Object[] {userId});
	}
	
	
	public Integer getEstimatedHours(Integer userId) {
		String countQuery="select sum(t.estimatedHours) from task t,taskuser tu where t.taskId=tu.taskId and userId=?";
		return stmt.queryForObject(countQuery, Integer.class,new Object[] {userId});
		
	}

}















