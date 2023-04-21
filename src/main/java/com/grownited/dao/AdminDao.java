package com.grownited.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProfileBean;
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
	
	public Integer getPendingProject() {
		String countQuery="select count(*) from project where statusId=2";
		return  stmt.queryForObject(countQuery, Integer.class);
	}
	public Integer getTotalDelayedProject() {
		String countQuery="select count(*) from project where statusId=3 ";

		Calendar c = Calendar.getInstance();

		int ddd = c.get(Calendar.DATE);
		int mmm = c.get(Calendar.MONTH) + 1;
		int yyy = c.get(Calendar.YEAR);

		String today = "";

		if (mmm < 10) {
			today = ddd + "-0" + mmm + "-" + yyy;
		} else {
			today = ddd + "-" + mmm + "-" + yyy;
		}
		System.out.println("TODAY => " + today);
		return stmt.queryForObject(countQuery,Integer.class);
		
	}
	
	public List<UtilizedHoursChartBean>getProjectStats(){
		String selectQ="select ";
		return"";
	}
	
	
	public void updateImageUrl(ProfileBean profileBean) {
		stmt.update("update users set imageUrl =? where userId=?",profileBean.getImageUrl(),profileBean.getUserId());
		
	}

	
	
		

}
