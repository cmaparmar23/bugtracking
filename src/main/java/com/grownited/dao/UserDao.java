package com.grownited.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.grownited.bean.ForgetPasswordBean;
import com.grownited.bean.LoginBean;
import com.grownited.bean.ProjectUserBean;
import com.grownited.bean.UserBean;
import com.grownited.bean.UpdatePasswordBean;
import com.grownited.bean.UserBean;

@Repository
public class UserDao {
	
	
	@Autowired
	JdbcTemplate stmt;//new
	
	
	//add customer--signup
	public void insertUser(UserBean userBean) {
		String insertQuery="insert into users(firstName,lastName,email,password,role,gender,number)values(?,?,?,?,?,?,?)";
		
		
		//role->2 for customer/buyer/user
		stmt.update(insertQuery,userBean.getFirstName(),userBean.getLastName(),userBean.getEmail(),userBean.getPassword(),2,userBean.getGender(),userBean.getNumber());//query execute
		
		
	}
	public UserBean authenticateUser(LoginBean loginBean) {
		try {
		String loginQuery="select * from users where email=? and password=?";
		UserBean user=stmt.queryForObject(loginQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
				new Object[] {loginBean.getEmail(),loginBean.getPassword()});
				
				return user;
	}catch(Exception e) {
		System.out.println("SMW--->UserDao::authenticateUser()");
		e.getMessage();
	}
		return null;
		
		
}
	
	
	
	public UserBean findUserByEmail(ForgetPasswordBean forgetPasswordBean) {
		try {
		String selectEmailQuery="select * from users where email=?";
		UserBean user=stmt.queryForObject(selectEmailQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
				new Object[] {forgetPasswordBean.getEmail()});
				
				return user;
	}catch(Exception e) {
		System.out.println("SMW--->UserDao::authenticateUser()");
		System.out.println(e.getMessage());
	}
		return null;
}
	
	
	
	public void updateOtp(String email,String otp) {
		String updateOtpQuery = "update users set otp = ? where email = ?";
		stmt.update(updateOtpQuery,otp,email);
}
	
	
	
	public void updateMyPassword(UpdatePasswordBean upBean) {
		String updateQuery="update users set password=?, otp = ? where email = ?";
		stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
	}
	
	public UserBean verifyOtpByEmail(UpdatePasswordBean upBean) {
		try {
			String otpQuery="select * from users where email=? and otp=?";
			UserBean user=stmt.queryForObject(otpQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] {upBean.getEmail(),upBean.getOtp()});
					return user;
					
		}catch(Exception e) {
			System.out.println("sw----->UserDao::verifyOtpByEmail()");
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	
	
	public UserBean getUserByEmail(String email) {
		String selectQuery = "select * from users where email  = ?";
		try {
		return stmt.queryForObject(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
				new Object[] { email });
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	
	//list
	
public List<UserBean>getAllUser(){
		
		String selectQuery= "select  *from users"; 
		List<UserBean>listUser=stmt.query(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return listUser;
	}

//view

public UserBean getUserById(Integer userId) {
	UserBean userBean=null;
	try {
		userBean=stmt.queryForObject("select * from users where userId=?",
				new BeanPropertyRowMapper<UserBean>(UserBean.class),new Object[] {userId});
		
	}
	catch(Exception e) {
		System.out.println("UserDao::getUserById()");
		System.out.println(e.getMessage());
	}
	return userBean;
}


//update

public void updateUser (UserBean userBean) {
String updateQuery="update users set firstName=?,lastName=?,email=?,password=?,gender=?,number=?,role=? where userId=?";
stmt.update(updateQuery,userBean.getFirstName(),userBean.getLastName(),userBean.getEmail(),userBean.getPassword(),userBean.getGender(),userBean.getNumber(),userBean.getRole(),userBean.getUserId());

}




}	
	
	
	
	
	
	
	
	
	
	
	

