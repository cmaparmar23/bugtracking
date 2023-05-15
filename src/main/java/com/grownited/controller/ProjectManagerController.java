package com.grownited.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProfileBean;
import com.grownited.bean.StatusChartBean;
import com.grownited.dao.ProjectManagerDao;

@Controller
public class ProjectManagerController {
	
	
	@Autowired
	ProjectManagerDao projectManagerDao;
	
	@GetMapping("/projectmanagerdashboard")
	public String managerDashboard(Model model) {
		System.out.println("Inside projectmanagerdashboard --url-metho--");
		
		
		List<StatusChartBean>chartData=projectManagerDao.getProjectStatus();
		
		model.addAttribute("chartData",chartData);

		return"ProjectManagerDashboard";
	}

	@GetMapping("/managermyprofile")
	public String managerProfile() {
		return"ManagerMyProfile";
	}
	
	@PostMapping("/saveprofilepic1")
	public String saveProfilePic1(ProfileBean profileBean) {
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
		projectManagerDao.updateImageUrl(profileBean);
		}catch(Exception e) {
			
		}
		return "redirect:/managermyprofile";
		
		
	}
	
	
	

}
