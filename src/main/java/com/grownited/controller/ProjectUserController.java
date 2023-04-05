package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.ProjectUserBean;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.ProjectUserDao;
import com.grownited.dao.UserDao;


@Controller
public class ProjectUserController {
	
	@Autowired
	ProjectUserDao projectUserDao;
	
	@Autowired
	ProjectDao projectDao;
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/newprojectuser")
	public String newProjectUser(Model model) {
		model.addAttribute("listProject",projectDao.getAllProject());
		model.addAttribute("listUser",userDao.getAllUser());
		return "NewProjectUser";
		
	}
	
	@PostMapping("/saveprojectuser")
	public String saveProjectUser(ProjectUserBean projectuserBean)
	{
		System.out.println(projectuserBean.getProjectUserId());
		projectUserDao.addProjectUser(projectuserBean);
		return "redirect:/listprojectuser";
		
		//dao
		//insert
	
		
	}
	@GetMapping("/listprojectuser")
	public String listProjectUser(Model model) {
		
		//pull all category from db-table
		List<ProjectUserBean> listProjectUser=projectUserDao.getAllProjectUser();
		model.addAttribute("listProjectUser",listProjectUser);
		return "ListProjectUser";
	}
	
	@GetMapping("/deleteprojectuser/{projectUserId}")
	public String deleteProjecUser(@PathVariable("projectUserId") Integer projectUserId) {
		
		projectUserDao.deleteProjectUser(projectUserId);
		return "redirect:/listprojectuser";
	}
	
	//view
	
	@GetMapping("/viewprojectuser")
	public String viewProjectUser(@RequestParam("projectUserId")Integer projectUserId,Model model) {
		ProjectUserBean projectUserBean =projectUserDao.getProjectUserById(projectUserId);
		model.addAttribute("projectUserBean",projectUserBean);
	return "ViewProjectUser";
	}
	
	
	
	

}
