package com.grownited.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProfileBean;
import com.grownited.dao.QADao;

public class QAContoller {
	
	@Autowired
	QADao qaDao;
	
	@GetMapping("/qadashboard")
	public String qaDashboard(Model model) {
		System.out.println("Inside admindashboard--url-metho--");
		return "QADashboard";
	}
		
		
		@GetMapping("/qa_profile")
		public String qaProfile() {
			return"QAProfile";
		}
		
		@PostMapping("/saveprofilepic3")
		public String saveProfilePic3(ProfileBean profileBean) {
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
			qaDao.updateImageUrl(profileBean);
			}catch(Exception e) {
				
			}
			return "redirect:/qa_profile";
			
			
		}



}