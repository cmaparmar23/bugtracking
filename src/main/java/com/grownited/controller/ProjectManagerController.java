package com.grownited.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.bean.StatusChartBean;
import com.grownited.dao.ProjectManagerDao;

@Controller
public class ProjectManagerController {
	
	
	@Autowired
	ProjectManagerDao projectManagerDao;
	
	@GetMapping("/projectmanagerdashboard")
	public String adminDashboard(Model model) {
		System.out.println("Inside projectmanagerdashboard --url-metho--");
		
		
		List<StatusChartBean>chartData=projectManagerDao.getProjectStatus();
		
		model.addAttribute("chartData",chartData);

		return"ProjectManagerDashboard";
	}

	
	

}
