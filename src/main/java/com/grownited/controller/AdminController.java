package com.grownited.controller;

import java.io.File;






import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.ProfileBean;
import com.grownited.bean.TechnologyBean;
import com.grownited.bean.UserBean;
import com.grownited.dao.AdminDao;
import com.grownited.dao.UserDao;



@Controller
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;
	
	
		@GetMapping("/admindashboard")
		public String adminDashboard(Model model) {
			System.out.println("Inside admindashboard--url-metho--");
			
			
			//total project
			Integer totalInProgessProject=adminDao.getInProgerssProject();
			Integer totalPendingProject=adminDao.getPendingProject();
			Integer totalDelayedProject=adminDao.getTotalDelayedProject();
			
			
			
			model.addAttribute("totalInProgessProject",totalInProgessProject);
			model.addAttribute("totalPendingProject",totalPendingProject);
			model.addAttribute("totalDelayedProject",totalDelayedProject);
			
			return"AdminDashboard";
		}
	
		
		
		@GetMapping("/myprofile")
		public String myProfile() {
			return"MyProfile";
		}
		
		@PostMapping("/saveprofilepic")
		public String saveProfilePic(ProfileBean profileBean) {
			System.out.println(profileBean.getUserId());
			System.out.println(profileBean.getProfileImg().getOriginalFilename());
			try {
			File userDir=new File("C:\\sts\\bug_tracking\\src\\main\\resources\\static\\assets1\\profile",profileBean.getUserId()+"");
			
			if( userDir.exists()==false) {
				userDir.mkdir();
			}
			File file=new File(userDir,profileBean.getProfileImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file,profileBean.getProfileImg().getBytes());
		
			profileBean.setImageUrl("assets1/profile"+profileBean.getUserId()+"/"+profileBean.getProfileImg().getOriginalFilename());
			adminDao.updateImageUrl(profileBean);
			}catch(Exception e) {
				
			}
			return "redirect:/myprofile";
			
			
		}
		
		
		
		

}
