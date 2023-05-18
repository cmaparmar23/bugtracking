package com.grownited.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProfileBean;
import com.grownited.bean.ProjectChartBean;
import com.grownited.bean.TechnologyBean;
import com.grownited.bean.UserBean;
import com.grownited.bean.UtilizedHoursChartBean;
@Repository

public class AdminDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	
	
	
	public Integer getInProgerssProject() {
		String countQuery="select count(*) from project where statusId=3";
		return stmt.queryForObject(countQuery, Integer.class);
	}
	
	public Integer getCompleted(){
		String countQuery="select count(*) from project where statusId=1";
		return  stmt.queryForObject(countQuery, Integer.class);
	}
	public Integer getTotalDelayedProject() {
		String countQuery="select count(*) from project where statusId=3  and completionDate ";

		
		return stmt.queryForObject(countQuery,Integer.class);
		
	}
	
	public List<UtilizedHoursChartBean>getProjectStats(){
		String selectQ="select projectName,utilizedHours from project ";
		return stmt.query(selectQ, new  BeanPropertyRowMapper<UtilizedHoursChartBean>(UtilizedHoursChartBean.class));
	}
	
	
	public void updateImageUrl(ProfileBean profileBean) {
		stmt.update("update users set imageUrl =? where userId=?",profileBean.getImageUrl(),profileBean.getUserId());
		
	}
	
	//developer chart
	
	public List<ProjectChartBean> getTaskStatus(Integer userId) {
		String selectQuery = "select monthname(assignDate) as month , count(taskUserId) as taskCount from taskuser where userId=? and year(assignDate) = 2023 group by monthname(assignDate),month(assignDate) order by month(assignDate)";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ProjectChartBean>(ProjectChartBean.class),new Object[] {userId});
	}
	
	public List<ProjectChartBean>getMyProjectStatus(Integer userId) {
		String selectQuery="select monthname(assignDate) as month,count(projectId) as projectcount from projectuser where userId=? and year(assignDate)=2023 group by monthname(assignDate),month(assignDate) order by month(assignDate) ";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ProjectChartBean>(ProjectChartBean.class),new Object[] {userId});
	}
	

	
	
		

}









