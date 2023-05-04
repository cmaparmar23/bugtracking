package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProjectBean;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.StatusDao;
import com.grownited.dao.TechnologyDao;

@Controller

public class P_ProjectController {
	@Autowired
	ProjectDao projectDao;
	
	@Autowired
	StatusDao statusDao;
	
	@Autowired
	TechnologyDao technologyDao;
	
	
	
	
	@GetMapping("/p_newproject")
	public String newP_Project(Model model) {
		model.addAttribute("list",technologyDao.getAllTechnology());
		model.addAttribute("listStatus",statusDao.getAllStatus());
		
		return "P_NewProject";

}
	@PostMapping("/p_saveproject")
	public String saveP_Project(ProjectBean projectBean)
	{
		System.out.println(projectBean.getProjectName());
		System.out.println(projectBean.getProjectId());
		projectDao.addProject(projectBean);
		return "redirect:/p_listproject";
}
	@GetMapping("/p_listproject")
	public String listP_Project(Model model) {
		
		//pull all category from db-table
		List<ProjectBean> plistProject=projectDao.getAllP_Project();
		model.addAttribute("plistProject",plistProject);
		return "P_ListProject";
	}
}