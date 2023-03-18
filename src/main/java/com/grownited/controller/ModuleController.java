package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.TaskBean;
import com.grownited.dao.ModuleDao;

@Controller

public class ModuleController {
	
	@Autowired
	ModuleDao moduleDao;
	
	@GetMapping("/newmodule")
	public String newModule() {
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
		List<ModuleBean>list=moduleDao.getAllModule();
		model.addAttribute("list",list);
		return "ListModule";
		
	}
	
	@GetMapping("/deletemodule/{moduleId}")
	public String deleteModule(@PathVariable("moduleId")Integer moduleId){
		moduleDao.deleteModule(moduleId);
		return "redirect:/listmodule";
	}
	
	@GetMapping("/viewmodule/{moduleId}")
	public String viewModule(@PathVariable("moduleId")Integer moduleId,Model model) {
		ModuleBean moduleBean =moduleDao.getModuleById(moduleId);
		model.addAttribute("moduleBean",moduleBean);
	return "ViewModule";
	}

}
