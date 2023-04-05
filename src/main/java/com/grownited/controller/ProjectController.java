package com.grownited.controller;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.ProjectBean;
import com.grownited.bean.ProjectBean;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.StatusDao;
import com.grownited.dao.TechnologyDao;
import com.grownited.dao.ProjectDao;

@Controller

public class ProjectController {
	
	@Autowired
	ProjectDao projectDao;
	
	
	@Autowired
	StatusDao statusDao;
	
	@Autowired
	TechnologyDao technologyDao;
	
	
	
	@GetMapping("/newproject")
	public String newProject(Model model) {
		model.addAttribute("list",technologyDao.getAllTechnology());
		model.addAttribute("listStatus",statusDao.getAllStatus());
		return "NewProject";
		
	}
	
	@PostMapping("/saveproject")
	public String saveProject(ProjectBean projectBean)
	{
		System.out.println(projectBean.getProjectName());
		System.out.println(projectBean.getProjectId());
		projectDao.addProject(projectBean);
		return "redirect:/listproject";
		
		//dao
		//insert
	
		
	}
	@GetMapping("/listproject")
	public String listProject(Model model) {
		
		//pull all category from db-table
		List<ProjectBean> listProject=projectDao.getAllProject();
		model.addAttribute("listProject",listProject);
		return "ListProject";
	}
	
	@GetMapping("/deleteproject/{projectId}")
	public String deleteProject(@PathVariable("projectId") Integer projectId) {
		
		projectDao.deleteProject(projectId);
		return "redirect:/listproject";
	}
	
	//view
	
	@GetMapping("/viewproject")
	public String viewProject(@RequestParam("projectId")Integer projectId,Model model) {
		ProjectBean projectBean =projectDao.getProjectById(projectId);
		model.addAttribute("projectBean",projectBean);
	return "ViewProject";
	}
	
	//edit
	
	@GetMapping("/editproject")
	public String editProject (@RequestParam("projectId") Integer projectId,Model model){
		
		ProjectBean projectBean=projectDao.getProjectById(projectId);
		model.addAttribute("projectBean",projectBean);
	model.addAttribute("list",technologyDao.getAllTechnology());
	model.addAttribute("listStatus",statusDao.getAllStatus());

		return "EditProject";
		
	}

	@PostMapping("/updateproject")
	public String updateProject(ProjectBean projectBean) {
		projectDao.updateProject(projectBean);
		return "redirect:/listproject";
	}
	
	

}
