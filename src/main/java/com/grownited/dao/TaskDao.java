package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.TaskBean;
import com.grownited.bean.TaskUserBean;

@Repository
public class TaskDao {
	@Autowired
	
	JdbcTemplate stmt;
	public void addTask(TaskBean taskBean) {
		String insertQuery="insert into task(moduleId,statusId,projectId,taskName,estimatedHours,totalUtilizedHours,documentUrl,description)values(?,?,?,?,?,?,?,?)";
		
		stmt.update(insertQuery,taskBean.getModuleId(),taskBean.getStatusId(),taskBean.getProjectId(),taskBean.getTaskName(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription());
		
	}
	
	public List<TaskBean> getAllTask() {
		String joinQuery="select m.moduleName,p.projectName,s.statusName,t.taskId,t.taskName,t.moduleId,t.projectId,t.statusId from task t,module m, project p,status s  where t.moduleId=m.moduleId and t.projectId=p.projectId and t.statusId=s.statusId ";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<TaskBean>(TaskBean.class));

		
		
		
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
		String updateQuery="update task set taskName=? , projectId=? ,statusId=? ,moduleId=? ,estimatedHours=? ,totalUtilizedHours=? ,documentUrl=? ,description=? where taskId=?";
		stmt.update(updateQuery,taskBean.getTaskName(),taskBean.getProjectId(),taskBean.getStatusId(),taskBean.getModuleId(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription(),taskBean.getTaskId());
		
	}



//developer

public void daddTask(TaskBean taskBean) {
	String insertQuery="insert into task(moduleId,statusId,projectId,taskName,estimatedHours,totalUtilizedHours,documentUrl,description)values(?,?,?,?,?,?,?,?)";
	
	stmt.update(insertQuery,taskBean.getModuleId(),taskBean.getStatusId(),taskBean.getProjectId(),taskBean.getTaskName(),taskBean.getEstimatedHours(),taskBean.getTotalUtilizedHours(),taskBean.getDocumentUrl(),taskBean.getDescription());
	
}
public List<TaskUserBean> getDAllTask(Integer userId) {
	String selectQuery="select p.projectName,tu.assignStatus,s.statusName,tu.utilizedHours from taskuser tu,users u,project p,status s , task t where  tu.taskId=t.taskId and t.projectId=p.projectId and tu.userId=u.userId and tu.userId=?";
	List<TaskUserBean> dlistTask=stmt.query(selectQuery, new BeanPropertyRowMapper<TaskUserBean>(TaskUserBean.class),new Object[]{userId});
	return dlistTask;

	
}	
}



