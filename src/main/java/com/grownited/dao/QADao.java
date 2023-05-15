package com.grownited.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ProfileBean;
@Repository

public class QADao {
	@Autowired
	JdbcTemplate stmt;
	public void updateImageUrl(ProfileBean profileBean) {
		stmt.update("update users set imageUrl =? where userId=?",profileBean.getImageUrl(),profileBean.getUserId());
		
	}

}
