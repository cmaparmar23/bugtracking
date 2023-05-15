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
import com.grownited.bean.TaskUserBean;
import com.grownited.bean.UserBean;
import com.grownited.dao.DeveloperDao;
import com.grownited.dao.TaskUserDao;

@Controller

public class DeveloperController {
	@Autowired
	DeveloperDao developerDao;
	
	@Autowired
	TaskUserDao taskUserDao;

	@GetMapping("/developerdashboard")
	public String developerDashboard(Model model,HttpSession session) {
		UserBean user=(UserBean)session.getAttribute("user");
		
	Integer getTotalTask=taskUserDao.getTotalTask(user.getUserId());
	Integer getTotalProgressTask=taskUserDao.getInprogressTask(user.getUserId());
	Integer getEstimatedHours=taskUserDao.getEstimatedHours(user.getUserId());
	
	
	
	
	model.addAttribute("getTotalTask",getTotalTask);
	model.addAttribute("getTotalProgessTask",getTotalProgressTask);
	model.addAttribute("getEstimatedHours",getEstimatedHours);

		return"DeveloperDashboard";
	}
	
	
	@GetMapping("/devprofile")
	public String devProfile() {
		return"DevProfile";
	}
	
	@PostMapping("/saveprofilepic2")
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
		developerDao.updateImageUrl(profileBean);
		}catch(Exception e) {
			
		}
		return "redirect:/devprofile";
		
		
	}

	
@GetMapping("/listdevtask")
public String devTask(HttpSession session,Model model) {
	UserBean user=(UserBean)session.getAttribute("user");
	List<TaskUserBean>devlist7=taskUserDao.getDevAllTask(user.getUserId());
	model.addAttribute("devlist7",devlist7);
	return "DevTask";
	
	
}
	

}
