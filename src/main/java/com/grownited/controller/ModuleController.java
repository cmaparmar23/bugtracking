package com.grownited.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.ProjectBean;
import com.grownited.dao.ModuleDao;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.StatusDao;

@Controller

public class ModuleController {
	
	@Autowired
	ModuleDao moduleDao;
	
	@Autowired
	ProjectDao projectDao;
	
	@Autowired
	StatusDao statusDao;
	
	
	@GetMapping("/newmodule")
	public String newModule(Model model) {
		model.addAttribute("listProject",projectDao.getAllProject());
		model.addAttribute("listStatus",statusDao.getAllStatus());
		return "NewModule";
		
	}
	
	@PostMapping("/savemodule")
	public String saveModule(ModuleBean moduleBean) {
		System.out.println(moduleBean.getModuleId());
		System.out.println(moduleBean.getModuleName());
		moduleDao.addModule(moduleBean);
		return "redirect:/listmodule";
		
	}
	
	
	@GetMapping("/listmodule")
	public String listModule(Model model) {
		List<ModuleBean>listModule=moduleDao.getAllModule();
		model.addAttribute("listModule",listModule);
		return "ListModule";
		
	}
	
	@GetMapping("/deletemodule/{moduleId}")
	public String deleteModule(@PathVariable("moduleId")Integer moduleId){
		moduleDao.deleteModule(moduleId);
		return "redirect:/listmodule";
	}
	
	@GetMapping("/viewmodule")
	public String viewModule(@RequestParam("moduleId")Integer moduleId,Model model) {
		ModuleBean moduleBean =moduleDao.getModuleById(moduleId);
		model.addAttribute("moduleBean",moduleBean);
	return "ViewModule";
	}
	
	
	//edit
	
		@GetMapping("/editmodule")
		public String editModule (@RequestParam("moduleId") Integer moduleId,Model model){
			
			ModuleBean moduleBean=moduleDao.getModuleById(moduleId);
			model.addAttribute("moduleBean",moduleBean);
		model.addAttribute("listProject",projectDao.getAllProject());
	model.addAttribute("listStatus",statusDao.getAllStatus());

			return "EditModule";
			
		}

		@PostMapping("/updatemodule")
		public String updateModule(ModuleBean moduleBean) {
			moduleDao.updateModule(moduleBean);
			return "redirect:/listmodule";
		}
		
	
	

}
