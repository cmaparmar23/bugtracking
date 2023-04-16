package com.grownited.controller;

import java.io.File;





import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProfileBean;



@Controller
public class AdminController {
	
		@GetMapping("/admindashboard")
		public String adminDashboard(Model model) {
			System.out.println("Inside admindashboard--url-metho--");
			model.addAttribute("totaltodaySale",200);
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
		
			profileBean.setImageUrl("assets1/profile/"+profileBean.getUserId()+"/"+profileBean.getProfileImg().getOriginalFilename());
			
			}catch(Exception e) {
				
			}
			return "redirect:/myprofile";
		}
		
		

}
