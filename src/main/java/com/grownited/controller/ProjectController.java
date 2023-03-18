package com.grownited.controller;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProjectBean;
import com.grownited.bean.TechnologyBean;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.TechnologyDao;

@Controller

public class ProjectController {
	
	@Autowired
	TechnologyDao technologyDao;
	
	@Autowired
	ProjectDao projectDao;
	
	@GetMapping("/newproject")
	public String newProject() {
		return "NewProject";
		
	}
	
	@PostMapping("/saveproject")
	public String saveProject(ProjectBean projectBean)
	{
		System.out.println(projectBean.getTitle());
		System.out.println(projectBean.getProjectId());
		projectDao.addProject(projectBean);
		return "redirect:/listproject";
		
		//dao
		//insert
	
		
	}
	@GetMapping("/listproject")
	public String listTechnology(Model model) {
		
		//pull all category from db-table
		List<ProjectBean> list=projectDao.getAllProject();
		model.addAttribute("list",list);
		return "ListProject";
	}
	
	@GetMapping("/deleteproject/{projectId}")
	public String deleteProject(@PathVariable("projectId") Integer projectId) {
		
		projectDao.deleteProject(projectId);
		return "redirect:/listproject";
	}
	
	//view
	
	@GetMapping("/viewproject/{projectId}")
	public String viewProject(@PathVariable("projectId")Integer projectId,Model model) {
		ProjectBean projectBean =projectDao.getProjectById(projectId);
		model.addAttribute("projectBean",projectBean);
	return "ViewProject";
	}
	
	
	
	

}
