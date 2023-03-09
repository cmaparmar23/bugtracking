package com.grownited.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.grownited.bean.ForgetPasswordBean;
import com.grownited.bean.LoginBean;
import com.grownited.bean.UpdatePasswordBean;
import com.grownited.bean.UserBean;
import com.grownited.dao.UserDao;
import com.grownited.service.EmailService;
import com.grownited.util.OtpGenetator;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

//annotation
@Controller

public class SessionController {
	
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	EmailService emailService;

	private HttpSession session;
	
	
	//jsp open
	
		@GetMapping("/signup")
		public	 String signup() {
			return "Signup";
		}
	//jsp input process
		
		@PostMapping("/saveuser")
		public String saveUser(UserBean user) {
	
			System.out.println(user.getFirstName());
			System.out.println(user.getEmail());
			
			
			userDao.insertUser(user);
			return"Login"; //Employeelogin.jsp
		}
		
		//calculate Temsalary()
		
		@GetMapping("/login")// URL => browser
		public String login() {
			return"Login";//jsp name
		}
		
		
		@PostMapping("/authentication")
		public String authentication(LoginBean login,Model model,HttpServletResponse response,HttpSession session) {
			System.out.println(login.getEmail());
			System.out.println(login.getPassword());
			
			UserBean userBean=userDao.authenticateUser(login);
			if(userBean==null) {
				
				//invalid
				model.addAttribute("error", "Invalid Credentials");
				return"Login";
				
			}else {
				 
				//cookie 
				Cookie c1 = new Cookie("userId",userBean.getUserId()+"");
				Cookie c2 = new Cookie("firstName", userBean.getFirstName());
	
				//add cookie 
				response.addCookie(c1);
				response.addCookie(c2);
				
				
				
				//session 
				session.setAttribute("userId", userBean.getUserId());
				
				//max inactive interval time 
				session.setMaxInactiveInterval(60*5);//second  
				
				
				
				if(userBean.getRole()==1) {
					//admin
					return "redirect:/admindashboard";
					
				}else if(userBean.getRole()==2)
					//projectmanager
				
				{
					return"redirect:/home";
				}
					
					
				else {
					return "404";
				}

				

			}
		
		}
		
		@GetMapping("/")
		public String root() {
			return"Login";
			
		}
		
		
		
		@GetMapping("/forgetpassword")
		public String forgetPassword() {
			return"ForgetPassword";
			
		}
		
		@PostMapping("/sendotpforforgetpassword")
		public String sendOtpForgetPassword(ForgetPasswordBean forgetPasswordBean ,Model model ){
			System.out.println(forgetPasswordBean.getEmail());
			
			
		UserBean user=userDao.findUserByEmail(forgetPasswordBean);
		if(user==null) {
			//error
			
			model.addAttribute("error","Invalid Email");
			return "ForgetPassword";
		}else {
			//otp
			//generate otp
			String otp=OtpGenetator.generateOTP(6);
			userDao.updateOtp(forgetPasswordBean.getEmail(), otp);
			
			
			//user set-->email
			//send email
			emailService.sendEmailForForgetPassword(forgetPasswordBean.getEmail(), otp);
			return "redirect:/updatepasswordjspopen";
			
		
		}
		
			
			
	}
		@GetMapping("/updatepasswordjspopen")
		public String updatePasswordJspOpen() {
			return "UpdatePassword";
		}
		
		
		@PostMapping("/updatemypassword")
		public String updateMyPassword(UpdatePasswordBean upBean) {
			System.out.println(upBean.getEmail());
			System.out.println(upBean.getPassword());
			System.out.println(upBean.getOtp());
			
			//email otp paasword confirpassword-not blank
			//password-confirpassword
			//otp==dbOtp
			
			UserBean user=userDao.verifyOtpByEmail(upBean);
			if(user==null) {
				return "UpdatePassword";
				
			}else {
				userDao.updateMyPassword(upBean);
				return "Login";
			}
			
		}
		
		
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/login";
		}
		

		
}





























