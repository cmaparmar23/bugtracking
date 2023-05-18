package com.grownited.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProfileBean;
import com.grownited.bean.ProjectChartBean;
import com.grownited.bean.StatusChartBean;
import com.grownited.bean.UserBean;
import com.grownited.dao.AdminDao;
import com.grownited.dao.ProjectManagerDao;
import com.grownited.dao.ProjectUserDao;

@Controller
public class ProjectManagerController {
	
	@Autowired
	ProjectUserDao projectUserDao;
	
	@Autowired
	AdminDao adminDao;
	
	
	
	@Autowired
	ProjectManagerDao projectManagerDao;
	
	@GetMapping("/projectmanagerdashboard")
	public String managerDashboard(Model model,HttpSession session) {
		UserBean user=(UserBean)session.getAttribute("user");
		
		Integer getTotalProjectYear=projectUserDao.getTotalProject();
		Integer getTotalRunningProject=projectUserDao.getTotalRunningProject();
		Integer getUtilizedHours=projectUserDao.getUtilizedHours();
		List<ProjectChartBean>chartData=adminDao.getMyProjectStatus(user.getUserId());
		
		model.addAttribute("getTotalProjectYear",getTotalProjectYear);
		model.addAttribute("getTotalRunningProject",getTotalRunningProject);
		model.addAttribute("getUtilizedHours",getUtilizedHours);
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
